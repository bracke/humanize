with Ada.Strings.Fixed;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;

package body Check_Humanize_Policy_Public_Surface is
   function Occurrence_Count
     (Text    : String;
      Pattern : String)
      return Natural
   is
      Position : Positive := Text'First;
      Count    : Natural := 0;
   begin
      if Pattern = "" then
         return 0;
      end if;

      loop
         declare
            Found : constant Natural :=
              Ada.Strings.Fixed.Index (Text, Pattern, From => Position);
         begin
            exit when Found = 0;
            Count := Count + 1;
            exit when Found + Pattern'Length > Text'Last;
            Position := Found + Pattern'Length;
         end;
      end loop;

      return Count;
   end Occurrence_Count;

   procedure Check_Perf_Exemption_Category
     (Root     : String;
      Coverage : String;
      Category : String;
      Key      : String;
      Errors   : in out Natural)
   is
      Count : constant Natural :=
        Occurrence_Count
          (Coverage, "perf_exempt_category = """ & Category & """");
      Max_Count : constant Natural := Policy_Threshold (Root, Key);
   begin
      if Count > Max_Count then
         Error
           (Errors,
            "public API perf exemption category exceeds ratchet: "
            & Category);
      end if;
   end Check_Perf_Exemption_Category;

   function Has_Package_Purpose_Comment
     (Spec        : String;
      Name        : String;
      Package_Pos : Natural)
      return Boolean
   is
      Comment_Pos : constant Natural :=
        Ada.Strings.Fixed.Index (Spec, "--");
      First_Declaration_End : constant Natural :=
        Ada.Strings.Fixed.Index (Spec, ";", From => Package_Pos);
   begin
      if Comment_Pos = 0 then
         return False;
      end if;

      if Comment_Pos < Package_Pos then
         return True;
      end if;

      return
        First_Declaration_End /= 0
        and then Comment_Pos
          < First_Declaration_End
        and then Ada.Strings.Fixed.Index
          (Spec, "package " & Name, From => Package_Pos) = Package_Pos;
   end Has_Package_Purpose_Comment;

   procedure Check_Public_Spec_Purpose_Comments
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String := Read_File (Root, "docs/PUBLIC_API.toml");

      procedure Check_Entry (Entry_Pos : Positive) is
         Name : constant String :=
           Manifest_String_Value_After (Manifest, "name = ", Entry_Pos);
         Spec_Path : constant String :=
           Manifest_String_Value_After (Manifest, "spec = ", Entry_Pos);
      begin
         if Name /= "" and then Spec_Path /= "" then
            declare
               Spec : constant String := Read_File (Root, Spec_Path);
               Package_Pos : constant Natural :=
                 Ada.Strings.Fixed.Index (Spec, "package " & Name);
            begin
               if Package_Pos = 0 then
                  Error
                    (Errors,
                     "public spec package declaration not found: "
                     & Spec_Path);
               elsif not Has_Package_Purpose_Comment
                 (Spec, Name, Package_Pos)
               then
                  Error
                    (Errors,
                     "public spec lacks package-level purpose comment: "
                     & Spec_Path);
               end if;
            end;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Manifest, "unit");
   end Check_Public_Spec_Purpose_Comments;

   procedure Check_Public_API_Unit_Coverage_Gaps
     (Root   : String;
      Errors : in out Natural)
   is
      Coverage : constant String :=
        Read_File (Root, "docs/PUBLIC_API_UNIT_COVERAGE.toml");
   begin
      if not Contains (Coverage, "[coverage_gaps]") then
         Error (Errors, "public API unit coverage must include coverage_gaps");
      end if;
      if not Contains (Coverage, "low_score_units = """"") then
         Error
           (Errors,
            "public API unit coverage must not have low-score public units");
      end if;
      if not Contains (Coverage, "missing_example_units = """"") then
         Error
           (Errors,
            "public API unit coverage must not have missing example units");
      end if;
      if not Contains (Coverage, "missing_perf_units = """"") then
         Error
           (Errors,
            "public API unit coverage must not report non-actionable perf gaps");
      end if;
      if not Contains (Coverage, "perf_applicable = ")
        or else not Contains (Coverage, "perf_exempt_category = ")
        or else not Contains (Coverage, "perf_exempt_reason = ")
        or else not Contains (Coverage, "perf_covered_by = ")
      then
         Error
           (Errors,
            "public API unit coverage must classify perf applicability");
      end if;
      if not Contains (Coverage, "test_file = ")
        or else not Contains (Coverage, "example_file = ")
        or else not Contains (Coverage, "consumer_file = ")
      then
         Error
           (Errors,
            "public API unit coverage must include concrete trace files");
      end if;

      Check_Perf_Exemption_Category
        (Root, Coverage, "family-child-facade",
         "performance_exempt_max_family_child_facade", Errors);
      Check_Perf_Exemption_Category
        (Root, Coverage, "parser-wrapper",
         "performance_exempt_max_parser_wrapper", Errors);
      Check_Perf_Exemption_Category
        (Root, Coverage, "phrase-wrapper",
         "performance_exempt_max_phrase_wrapper", Errors);
      Check_Perf_Exemption_Category
        (Root, Coverage, "pure-type-package",
         "performance_exempt_max_pure_type_package", Errors);
      Check_Perf_Exemption_Category
        (Root, Coverage, "root-facade",
         "performance_exempt_max_root_facade", Errors);
      Check_Perf_Exemption_Category
        (Root, Coverage, "support-facade",
         "performance_exempt_max_support_facade", Errors);
      Check_Perf_Exemption_Category
        (Root, Coverage, "trivial-label-facade",
         "performance_exempt_max_trivial_label_facade", Errors);
   end Check_Public_API_Unit_Coverage_Gaps;
end Check_Humanize_Policy_Public_Surface;
