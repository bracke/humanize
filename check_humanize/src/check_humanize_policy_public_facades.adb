with Ada.Strings.Fixed;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Source_Budgets;

package body Check_Humanize_Policy_Public_Facades is
   function Public_Child_Count
     (Public_API   : String;
      Child_Prefix : String)
      return Natural
   is
      Position : Positive := Public_API'First;
      Count    : Natural := 0;
   begin
      if Child_Prefix = "" then
         return 0;
      end if;

      loop
         declare
            Name_Pos : constant Natural :=
              Ada.Strings.Fixed.Index
                (Public_API,
                 "name = """ & Child_Prefix,
                 From => Position);
         begin
            exit when Name_Pos = 0;
            Count := Count + 1;

            if Name_Pos = Public_API'Last then
               exit;
            else
               Position := Name_Pos + 1;
            end if;
         end;
      end loop;

      return Count;
   end Public_Child_Count;

   function Delimited_Item_Count (Items : String) return Natural is
      Position : Positive := Items'First;
      Count    : Natural := 0;
   begin
      if Items = "" then
         return 0;
      end if;

      loop
         declare
            Separator : constant Natural :=
              Ada.Strings.Fixed.Index (Items, "|", From => Position);
         begin
            Count := Count + 1;
            exit when Separator = 0;
            Position := Separator + 1;
         end;
      end loop;

      return Count;
   end Delimited_Item_Count;

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

   procedure Check_Delimited_Public_Facade_Items
     (Spec       : String;
      Public_API : String;
      Items      : String;
      Unit       : String;
      Label      : String;
      Errors     : in out Natural)
   is
      Position          : Positive := Items'First;
      Previous_Item_Pos : Natural := 0;
   begin
      if Items = "" then
         Error (Errors, "public facade " & Label & " list is empty for " & Unit);
         return;
      end if;

      loop
         declare
            Separator : constant Natural :=
              Ada.Strings.Fixed.Index (Items, "|", From => Position);
            Last      : constant Natural :=
              (if Separator = 0 then Items'Last else Separator - 1);
            Item      : constant String := Items (Position .. Last);
         begin
            if Item = "" then
               Error
                 (Errors,
                  "public facade " & Label & " list has an empty item for "
                  & Unit);
            elsif Label = "child_units" then
               if not Contains (Public_API, "name = """ & Item & """") then
                  Error
                    (Errors,
                     "public facade child unit missing from public API: "
                     & Item);
               end if;
               if not Contains (Spec, "* " & Item & ":") then
                  Error
                    (Errors,
                     "public facade map missing child unit " & Item
                     & " for " & Unit);
               end if;
            else
               declare
                  Item_Pos : constant Natural :=
                    Ada.Strings.Fixed.Index (Spec, Item);
                  Duplicate_Pos : constant Natural :=
                    (if Item_Pos = 0 then 0
                     else Ada.Strings.Fixed.Index
                       (Spec, Item, From => Item_Pos + Item'Length));
               begin
                  if Item_Pos = 0 then
                     Error
                       (Errors,
                        "public facade section marker missing for " & Unit
                        & ": " & Item);
                  elsif Duplicate_Pos /= 0 then
                     Error
                       (Errors,
                        "public facade section marker duplicated for " & Unit
                        & ": " & Item);
                  elsif Previous_Item_Pos /= 0
                    and then Item_Pos <= Previous_Item_Pos
                  then
                     Error
                       (Errors,
                        "public facade section marker out of order for " & Unit
                        & ": " & Item);
                  end if;

                  if Item_Pos /= 0 then
                     Previous_Item_Pos := Item_Pos;
                  end if;
               end;
            end if;

            exit when Separator = 0;
            Position := Separator + 1;
         end;
      end loop;
   end Check_Delimited_Public_Facade_Items;

   procedure Check_Public_Facade_Budgets
     (Root   : String;
      Errors : in out Natural)
   is
      Manifest : constant String :=
        Read_File (Root, "docs/PUBLIC_FACADE_BUDGETS.toml");
      Public_API : constant String := Read_File (Root, "docs/PUBLIC_API.toml");
      Count    : Natural := 0;

      procedure Check_Entry (Entry_Pos : Positive) is
         Unit : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "unit = ", Entry_Pos);
         Path : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "path = ", Entry_Pos);
         Target_Lines : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "target_lines = ", Entry_Pos);
         Max_Lines : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "max_lines = ", Entry_Pos);
         Min_Headroom_Lines : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "min_headroom_lines = ", Entry_Pos);
         Max_Bytes : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "max_bytes = ", Entry_Pos);
         Child_Prefix : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "child_prefix = ", Entry_Pos);
         Min_Child_Units : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "min_child_units = ", Entry_Pos);
         Map_Marker : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "map_marker = ", Entry_Pos);
         Child_Unit_Count : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "child_unit_count = ", Entry_Pos);
         Child_Units : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "child_units = ", Entry_Pos);
         Section_Marker_Count : constant Natural :=
           Natural_Value_After
             (Manifest, ASCII.LF & "section_marker_count = ", Entry_Pos);
         Section_Markers : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "section_markers = ", Entry_Pos);
         Usecase : constant String :=
           Manifest_String_Value_After
             (Manifest, ASCII.LF & "usecase = ", Entry_Pos);
      begin
         if Unit = "" or else Path = "" or else Target_Lines = 0
           or else Max_Lines = 0
           or else Min_Headroom_Lines = 0
           or else Max_Bytes = 0
           or else Map_Marker = ""
           or else Section_Markers = ""
           or else Section_Marker_Count = 0
           or else Usecase = ""
         then
            Error (Errors, "public facade budget entry is incomplete");
         else
            Project_Tools.Source_Budgets.Check_Line_Byte_Budget
              (Errors, Root, Path, "public facade", Target_Lines, Max_Lines,
               Min_Headroom_Lines, Max_Bytes);
            declare
               Spec : constant String := Read_File (Root, Path);
            begin
               if not Contains (Spec, Map_Marker) then
                  Error (Errors, "public facade map missing from " & Unit);
               end if;
               if Public_Child_Count (Public_API, Child_Prefix)
                 < Min_Child_Units
               then
                  Error
                    (Errors,
                     "public facade child package inventory too small for "
                     & Unit);
               end if;
               if Child_Unit_Count > 0
                 and then Child_Unit_Count /= Delimited_Item_Count (Child_Units)
               then
                  Error
                    (Errors,
                     "public facade child_unit_count does not match "
                     & "child_units for " & Unit);
               elsif Child_Unit_Count = 0 and then Child_Units /= "" then
                  Error
                    (Errors,
                     "public facade child_units must be empty when "
                     & "child_unit_count is zero for " & Unit);
               end if;
               if Section_Marker_Count
                 /= Delimited_Item_Count (Section_Markers)
               then
                  Error
                    (Errors,
                     "public facade section_marker_count does not match "
                     & "section_markers for " & Unit);
               end if;
               if Child_Unit_Count > 0
                 and then Public_Child_Count (Public_API, Child_Prefix)
                   /= Delimited_Item_Count (Child_Units)
               then
                  Error
                    (Errors,
                     "public facade child package inventory does not "
                     & "match child_units for " & Unit);
               end if;
               if Occurrence_Count (Spec, "Facade section:")
                 /= Delimited_Item_Count (Section_Markers)
               then
                  Error
                    (Errors,
                     "public facade section inventory does not match "
                     & "section_markers for " & Unit);
               end if;
               if Child_Unit_Count > 0 then
                  Check_Delimited_Public_Facade_Items
                    (Spec, Public_API, Child_Units, Unit, "child_units",
                     Errors);
               end if;
               Check_Delimited_Public_Facade_Items
                 (Spec, Public_API, Section_Markers, Unit, "section_markers",
                  Errors);
            end;
            Count := Count + 1;
         end if;
      end Check_Entry;

      procedure Check_Entries is new Iterate_Manifest_Section (Check_Entry);
   begin
      Check_Entries (Manifest, "facade");

      Require_Minimum
        (Root, Errors, "public_facade_budget_min_entries", Count,
         "public facade budgets must cover the large root facades");
   end Check_Public_Facade_Budgets;
end Check_Humanize_Policy_Public_Facades;
