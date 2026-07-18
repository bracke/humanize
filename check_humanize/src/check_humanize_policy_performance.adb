with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;

package body Check_Humanize_Policy_Performance is
   procedure Check_Performance_Baseline
     (Root   : String;
      Errors : in out Natural)
   is
      Baseline : constant String :=
        Read_File (Root, "docs/PERFORMANCE_BASELINE.toml");
      Smoke : constant String := Read_File (Root, "tests/src/perf_smoke.adb");
      Public_API : constant String := Read_File (Root, "docs/PUBLIC_API.toml");

      function Section (Name : String) return String is
         Header : constant String := "[" & Name & "]";
         First  : constant Natural := Ada.Strings.Fixed.Index (Baseline, Header);
      begin
         if First = 0 then
            return "";
         end if;

         declare
            Next : constant Natural :=
              Ada.Strings.Fixed.Index
                (Baseline, ASCII.LF & "[", From => First + Header'Length);
         begin
            if Next = 0 then
               return Baseline (First .. Baseline'Last);
            else
               return Baseline (First .. Next - 1);
            end if;
         end;
      end Section;

      function Paths_Array (Table : String) return String is
         Paths_Key : constant String := "paths = [";
         Paths_Pos : constant Natural :=
           Ada.Strings.Fixed.Index (Table, Paths_Key);
      begin
         if Paths_Pos = 0 then
            return "";
         end if;

         declare
            First : constant Natural := Paths_Pos + Paths_Key'Length;
            Last  : constant Natural :=
              Ada.Strings.Fixed.Index (Table, "]", From => First);
         begin
            if Last = 0 or else Last <= First then
               return "";
            else
               return Table (First .. Last - 1);
            end if;
         end;
      end Paths_Array;

      function Quoted_Item_Count (Text : String) return Natural is
         Position : Positive := Text'First;
         Count    : Natural := 0;
      begin
         while Position <= Text'Last loop
            declare
               First_Quote : constant Natural :=
                 Ada.Strings.Fixed.Index (Text, """", From => Position);
            begin
               exit when First_Quote = 0;
               declare
                  Last_Quote : constant Natural :=
                    Ada.Strings.Fixed.Index
                      (Text, """", From => First_Quote + 1);
               begin
                  exit when Last_Quote = 0;
                  Count := Count + 1;
                  Position := Last_Quote + 1;
               end;
            end;
         end loop;

         return Count;
      end Quoted_Item_Count;

      function Mapping_Count (Table : String) return Natural is
         Position : Positive := Table'First;
         Count    : Natural := 0;
      begin
         while Position <= Table'Last loop
            declare
               Newline : constant Natural :=
                 Ada.Strings.Fixed.Index (Table, ASCII.LF & "", From => Position);
               Line_Last : constant Natural :=
                 (if Newline = 0 then Table'Last else Newline - 1);
            begin
               if Line_Last >= Position then
                  declare
                     Line : constant String := Table (Position .. Line_Last);
                  begin
                     if Ada.Strings.Fixed.Index (Line, " = ") /= 0 then
                        Count := Count + 1;
                     end if;
                  end;
               end if;

               exit when Newline = 0;
               Position := Newline + 1;
            end;
         end loop;

         return Count;
      end Mapping_Count;

      function Public_API_Key (Unit_Name : String) return String is
         Result : String := Unit_Name;
      begin
         for Ch of Result loop
            if Ch = '.' then
               Ch := '_';
            end if;
         end loop;
         return Result;
      end Public_API_Key;

      function Has_Public_API_Key (Key : String) return Boolean is
         Position : Positive := Public_API'First;
      begin
         loop
            declare
               Unit_Pos : constant Natural :=
                 Ada.Strings.Fixed.Index
                   (Public_API, "name = """, From => Position);
            begin
               exit when Unit_Pos = 0;
               declare
                  Name : constant String :=
                    Quoted_Value_After (Public_API, "name = ", Unit_Pos);
               begin
                  if Public_API_Key (Name) = Key then
                     return True;
                  end if;

                  exit when Unit_Pos = Public_API'Last;
                  Position := Unit_Pos + 1;
               end;
            end;
         end loop;

         return False;
      end Has_Public_API_Key;

      function Has_Area (Areas : String; Area : String) return Boolean is
        (Contains (Areas, ASCII.LF & Area & ASCII.LF));

      procedure Add_Area
        (Areas : in out Unbounded_String;
         Area  : String)
      is
      begin
         if Area /= "" and then not Has_Area (To_String (Areas), Area) then
            Append (Areas, ASCII.LF & Area & ASCII.LF);
         end if;
      end Add_Area;

      procedure Check_Path_Subset
        (Section_Name : String;
         Root_Paths   : String;
         Min_Key      : String)
      is
         Table : constant String := Section (Section_Name);
         Paths : constant String := Paths_Array (Table);
         Count : constant Natural := Quoted_Item_Count (Paths);
         Position : Positive := Paths'First;
      begin
         if Table = "" or else Paths = "" then
            Error
              (Errors,
               "performance baseline missing paths for " & Section_Name);
            return;
         end if;

         Require_Minimum
           (Root, Errors, Min_Key, Count,
            "performance baseline has too few paths for " & Section_Name);

         while Position <= Paths'Last loop
            declare
               First_Quote : constant Natural :=
                 Ada.Strings.Fixed.Index (Paths, """", From => Position);
            begin
               exit when First_Quote = 0;
               declare
                  Last_Quote : constant Natural :=
                    Ada.Strings.Fixed.Index
                      (Paths, """", From => First_Quote + 1);
               begin
                  exit when Last_Quote = 0;
                  declare
                     Path : constant String :=
                       Paths (First_Quote + 1 .. Last_Quote - 1);
                  begin
                     if not Contains (Root_Paths, """" & Path & """") then
                        Error
                          (Errors,
                           "performance subsection path is absent from root "
                           & "path inventory: " & Path);
                     end if;
                  end;
                  Position := Last_Quote + 1;
               end;
            end;
         end loop;
      end Check_Path_Subset;

      procedure Check_Public_API_Mappings (Root_Paths : String) is
         Table    : constant String := Section ("perf_smoke.public_api_units");
         Position : Positive := Table'First;
      begin
         if Table = "" then
            Error
              (Errors,
               "performance baseline missing public API perf coverage mapping");
            return;
         end if;

         Require_Minimum
           (Root, Errors, "performance_public_api_min_mappings",
            Mapping_Count (Table),
            "performance baseline has too few public API perf mappings");

         while Position <= Table'Last loop
            declare
               Newline : constant Natural :=
                 Ada.Strings.Fixed.Index (Table, ASCII.LF & "", From => Position);
               Line_Last : constant Natural :=
                 (if Newline = 0 then Table'Last else Newline - 1);
            begin
               if Line_Last >= Position then
                  declare
                     Line : constant String := Table (Position .. Line_Last);
                     Equal_Pos : constant Natural :=
                       Ada.Strings.Fixed.Index (Line, " = ");
                  begin
                     if Equal_Pos /= 0 then
                        declare
                           Key : constant String :=
                             Line (Line'First .. Equal_Pos - 1);
                           Path : constant String :=
                             Quoted_Value_After (Line, " = ", Equal_Pos);
                        begin
                           if not Has_Public_API_Key (Key) then
                              Error
                                (Errors,
                                 "performance baseline maps non-public unit "
                                 & Key);
                           end if;

                           if Path = "" then
                              Error
                                (Errors,
                                 "performance baseline has an empty public "
                                 & "API mapping");
                           elsif not Contains
                             (Root_Paths, """" & Path & """")
                           then
                              Error
                                (Errors,
                                 "performance baseline public API mapping "
                                 & "references unknown smoke path " & Path);
                           end if;
                        end;
                     end if;
                  end;
               end if;

               exit when Newline = 0;
               Position := Newline + 1;
            end;
         end loop;
      end Check_Public_API_Mappings;

      procedure Check_Public_API_Area_Coverage (Root_Paths : String) is
         Table : constant String := Section ("perf_smoke.area_coverage");
         Areas : Unbounded_String;
         Covered_Count : Natural := 0;

         procedure Collect_Area (Entry_Pos : Positive) is
            Area : constant String :=
              Manifest_String_Value_After (Public_API, "area = ", Entry_Pos);
         begin
            Add_Area (Areas, Area);
         end Collect_Area;

         procedure Collect_Areas is new Iterate_Manifest_Section (Collect_Area);

         procedure Check_Area_Line (Area : String) is
            Value : constant String :=
              Quoted_Value_After (Table, Area & " = ", Table'First);
         begin
            if Value = "" then
               Error
                 (Errors,
                  "performance baseline missing public API area coverage for "
                  & Area);
            elsif Starts_With (Value, "exempt:") then
               Covered_Count := Covered_Count + 1;
            elsif not Contains (Root_Paths, """" & Value & """") then
               Error
                 (Errors,
                  "performance baseline area coverage references unknown "
                  & "smoke path " & Value);
            else
               Covered_Count := Covered_Count + 1;
            end if;
         end Check_Area_Line;
      begin
         if Table = "" then
            Error
              (Errors,
               "performance baseline missing public API area coverage table");
            return;
         end if;

         Collect_Areas (Public_API, "unit");

         declare
            Area_Text : constant String := To_String (Areas);
            Position  : Natural := Area_Text'First;
         begin
            while Position <= Area_Text'Last loop
               declare
                  Line_End : constant Natural :=
                    Ada.Strings.Fixed.Index
                      (Area_Text, String'(1 => ASCII.LF), From => Position);
               begin
                  exit when Line_End = 0;
                  if Line_End > Position then
                     Check_Area_Line (Area_Text (Position .. Line_End - 1));
                  end if;
                  exit when Line_End = Area_Text'Last;
                  Position := Line_End + 1;
               end;
            end loop;
         end;

         Require_Minimum
           (Root, Errors, "performance_public_api_min_areas", Covered_Count,
            "performance baseline covers too few public API areas");
      end Check_Public_API_Area_Coverage;
   begin
      if not Contains (Baseline, "iterations = 2000")
        or else not Contains (Smoke, "Iterations : constant Positive := 2_000")
      then
         Error (Errors, "performance baseline iteration count is out of sync");
      end if;

      if not Contains (Baseline, "max_seconds = 30.0")
        or else not Contains (Smoke, "Max_Seconds : constant Duration := 30.0")
      then
         Error (Errors, "performance baseline threshold is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.formatting]")
        or else not Contains (Baseline, "max_seconds = 12.0")
        or else not Contains
          (Smoke, "Max_Format_Seconds : constant Duration := 12.0")
      then
         Error (Errors, "formatting performance baseline is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.parsing]")
        or else not Contains (Baseline, "max_seconds = 18.0")
        or else not Contains
          (Smoke, "Max_Parse_Seconds : constant Duration := 18.0")
      then
         Error (Errors, "parsing performance baseline is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.text]")
        or else not Contains (Baseline, "max_seconds = 10.0")
        or else not Contains
          (Smoke, "Max_Text_Seconds : constant Duration := 10.0")
        or else not Contains (Smoke, "perf smoke text")
      then
         Error (Errors, "text performance baseline is out of sync");
      end if;

      if not Contains (Baseline, "[perf_smoke.domain]")
        or else not Contains
          (Smoke, "Max_Domain_Seconds : constant Duration := 10.0")
        or else not Contains (Smoke, "perf smoke domain")
      then
         Error (Errors, "domain performance baseline is out of sync");
      end if;

      declare
         Root_Paths : constant String := Paths_Array (Section ("perf_smoke"));
         Root_Count : constant Natural := Quoted_Item_Count (Root_Paths);
      begin
         Require_Minimum
           (Root, Errors, "performance_root_min_paths", Root_Count,
            "performance baseline root path inventory is too small");

         Check_Path_Subset
           ("perf_smoke.formatting", Root_Paths,
            "performance_formatting_min_paths");
         Check_Path_Subset
           ("perf_smoke.parsing", Root_Paths, "performance_parsing_min_paths");
         Check_Path_Subset
           ("perf_smoke.text", Root_Paths, "performance_text_min_paths");
         Check_Path_Subset
           ("perf_smoke.domain", Root_Paths, "performance_domain_min_paths");
         Check_Public_API_Mappings (Root_Paths);
         Check_Public_API_Area_Coverage (Root_Paths);
      end;
   end Check_Performance_Baseline;
end Check_Humanize_Policy_Performance;
