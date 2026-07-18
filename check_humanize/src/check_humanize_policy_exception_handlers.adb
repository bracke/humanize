with Ada.Directories;

with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;
with Project_Tools.Ada_Source;

package body Check_Humanize_Policy_Exception_Handlers is
   procedure Check_Intentional_Silent_Recovery
     (Root   : String;
      Errors : in out Natural)
   is
      Silent_Pattern : constant String := "when others => null";
      Silent_Marker  : constant String := "intentional silent recovery";
      Parse_Failure_Marker : constant String := "parse failure normalization";
      Defensive_Marker     : constant String := "defensive recovery";
      Runtime_Parse_Failure_Count : Natural := 0;
      Runtime_Defensive_Count     : Natural := 0;
      Runtime_Silent_Count        : Natural := 0;
      Tooling_Parse_Failure_Count : Natural := 0;
      Tooling_Defensive_Count     : Natural := 0;
      Tooling_Silent_Count        : Natural := 0;

      function Has_Recovery_Marker (Line : String) return Boolean is
        (Contains (Line, Silent_Marker)
         or else Contains (Line, "intentional fallback")
         or else Contains (Line, "parse failure normalization")
         or else Contains (Line, "invalid input normalization")
         or else Contains (Line, "defensive recovery"));

      procedure Check_File
        (Relative_Path        : String;
         Parse_Failure_Count  : in out Natural;
         Defensive_Count      : in out Natural;
         Silent_Count         : in out Natural)
      is
         procedure Check_Handler
           (Line_Number : Positive;
            Line        : String)
         is
         begin
            if Contains (Line, Silent_Pattern)
              and then not Contains (Line, Silent_Marker)
            then
               Error
                 (Errors,
                  Relative_Path & ":"
                  & Natural'Image (Line_Number)
                  & " must mark intentional silent recovery");
            elsif not Has_Recovery_Marker (Line) then
               Error
                 (Errors,
                  Relative_Path & ":"
                  & Natural'Image (Line_Number)
                  & " must classify broad exception recovery");
            else
               if Contains (Line, Parse_Failure_Marker) then
                  Parse_Failure_Count := Parse_Failure_Count + 1;
               elsif Contains (Line, Defensive_Marker) then
                  Defensive_Count := Defensive_Count + 1;
               elsif Contains (Line, Silent_Marker) then
                  Silent_Count := Silent_Count + 1;
               end if;
            end if;
         end Check_Handler;
      begin
         Project_Tools.Ada_Source.Scan_Broad_Exception_Handlers
           (Root & "/" & Relative_Path, Check_Handler'Access);
      end Check_File;

      procedure Check_Directory
        (Relative_Dir         : String;
         Parse_Failure_Count  : in out Natural;
         Defensive_Count      : in out Natural;
         Silent_Count         : in out Natural)
      is
         Search      : Ada.Directories.Search_Type;
         Search_Open : Boolean := False;
         Item        : Ada.Directories.Directory_Entry_Type;
      begin
         Ada.Directories.Start_Search
           (Search    => Search,
            Directory => Root & "/" & Relative_Dir,
            Pattern   => "*.ad?",
            Filter    => [Ada.Directories.Ordinary_File => True,
                          others => False]);
         Search_Open := True;

         while Ada.Directories.More_Entries (Search) loop
            Ada.Directories.Get_Next_Entry (Search, Item);
            Check_File
              (Relative_Dir & "/" & Ada.Directories.Simple_Name (Item),
               Parse_Failure_Count, Defensive_Count, Silent_Count);
         end loop;

         Ada.Directories.End_Search (Search);
         Search_Open := False;
      exception
         when Constraint_Error
            | Ada.Directories.Name_Error
            | Ada.Directories.Use_Error =>
            if Search_Open then
               Ada.Directories.End_Search (Search);
            end if;
            raise;
      end Check_Directory;
   begin
      Check_Directory
        ("src", Runtime_Parse_Failure_Count, Runtime_Defensive_Count,
         Runtime_Silent_Count);
      Check_Directory
        ("check_humanize/src", Tooling_Parse_Failure_Count,
         Tooling_Defensive_Count, Tooling_Silent_Count);

      Require_Maximum
        (Root, Errors, "exception_marker_max_parse_failure_normalization",
         Runtime_Parse_Failure_Count,
         "parse failure normalization handler count grew");
      Require_Maximum
        (Root, Errors, "exception_marker_max_defensive_recovery",
         Runtime_Defensive_Count,
         "defensive recovery handler count grew");
      Require_Maximum
        (Root, Errors, "exception_marker_max_intentional_silent_recovery",
         Runtime_Silent_Count,
         "intentional silent recovery handler count grew");
      Require_Maximum
        (Root, Errors,
         "tooling_exception_marker_max_parse_failure_normalization",
         Tooling_Parse_Failure_Count,
         "tooling parse failure normalization handler count grew");
      Require_Maximum
        (Root, Errors, "tooling_exception_marker_max_defensive_recovery",
         Tooling_Defensive_Count,
         "tooling defensive recovery handler count grew");
      Require_Maximum
        (Root, Errors,
         "tooling_exception_marker_max_intentional_silent_recovery",
         Tooling_Silent_Count,
         "tooling intentional silent recovery handler count grew");
   end Check_Intentional_Silent_Recovery;
end Check_Humanize_Policy_Exception_Handlers;
