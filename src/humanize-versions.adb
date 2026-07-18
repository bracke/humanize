with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Versions is
   use type Humanize.Status.Status_Code;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Is_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (Char : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Contains (Text, Pattern : String) return Boolean
      renames Humanize.Bounded_Text.Contains_Text;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Value_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Version_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Version_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Version_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Version_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Version_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Parse_Number
     (Text  : String;
      Value : out Natural)
      return Boolean
   is
      Accum : Natural := 0;
   begin
      if Text'Length = 0 then
         return False;
      end if;

      for Char of Text loop
         if not Is_Digit (Char) then
            return False;
         end if;
         Accum := Accum * 10 + Digit_Value (Char);
      end loop;

      Value := Accum;
      return True;
   end Parse_Number;

   procedure Copy_Field
     (Source : String;
      Target : out String;
      Length : out Natural)
   is
   begin
      Target := [others => ' '];
      Length := Natural'Min (Source'Length, Target'Length);
      if Length > 0 then
         Target (Target'First .. Target'First + Length - 1) :=
           Source (Source'First .. Source'First + Length - 1);
      end if;
   end Copy_Field;

   function Parse_Semver
     (Text : String)
      return Version_Info
   is
      Item : constant String := Trim (Text);
      Result : Version_Info;
      Core_End : Natural := Item'Last;
      Pre_Start : Natural := 0;
      Build_Start : Natural := 0;
      First : Natural;
      Dot1  : Natural := 0;
      Dot2  : Natural := 0;
   begin
      if Item'Length = 0 then
         return Result;
      end if;

      First := Item'First;
      if Item (First) = 'v' or else Item (First) = 'V' then
         First := First + 1;
      end if;
      if First > Item'Last then
         return Result;
      end if;

      for Index in First .. Item'Last loop
         if Item (Index) = '+' then
            Build_Start := Index + 1;
            Core_End := Index - 1;
            exit;
         elsif Item (Index) = '-' then
            Pre_Start := Index + 1;
            Core_End := Index - 1;
            exit;
         end if;
      end loop;

      if Pre_Start /= 0 then
         for Index in Pre_Start .. Item'Last loop
            if Item (Index) = '+' then
               Build_Start := Index + 1;
               Copy_Field
                 (Item (Pre_Start .. Index - 1),
                  Result.Prerelease, Result.Prerelease_Length);
               exit;
            end if;
         end loop;
         if Result.Prerelease_Length = 0 then
            Copy_Field
              (Item (Pre_Start .. Item'Last),
               Result.Prerelease, Result.Prerelease_Length);
         end if;
      end if;

      if Build_Start /= 0 and then Build_Start <= Item'Last then
         Copy_Field (Item (Build_Start .. Item'Last), Result.Build, Result.Build_Length);
      end if;

      for Index in First .. Core_End loop
         if Item (Index) = '.' then
            if Dot1 = 0 then
               Dot1 := Index;
            elsif Dot2 = 0 then
               Dot2 := Index;
            else
               return Result;
            end if;
         end if;
      end loop;

      if Dot1 = 0 then
         if not Parse_Number (Item (First .. Core_End), Result.Major) then
            return Result;
         end if;
      elsif Dot2 = 0 then
         if not Parse_Number (Item (First .. Dot1 - 1), Result.Major)
           or else not Parse_Number (Item (Dot1 + 1 .. Core_End), Result.Minor)
         then
            return Result;
         end if;
         Result.Has_Minor := True;
      else
         if not Parse_Number (Item (First .. Dot1 - 1), Result.Major)
           or else not Parse_Number (Item (Dot1 + 1 .. Dot2 - 1), Result.Minor)
           or else not Parse_Number (Item (Dot2 + 1 .. Core_End), Result.Patch)
         then
            return Result;
         end if;
         Result.Has_Minor := True;
         Result.Has_Patch := True;
      end if;

      Result.Valid := True;
      return Result;
   exception
      when Constraint_Error => --  defensive recovery
         return (others => <>);
   end Parse_Semver;

   function Normalized (Version : Version_Info) return String is
      Text : Unbounded_String;
   begin
      Append (Text, Image (Version.Major));
      if Version.Has_Minor or else Version.Has_Patch then
         Append (Text, "." & Image (Version.Minor));
      end if;
      if Version.Has_Patch then
         Append (Text, "." & Image (Version.Patch));
      end if;
      if Version.Prerelease_Length > 0 then
         Append
           (Text, "-" & Version.Prerelease
            (Version.Prerelease'First .. Version.Prerelease'First + Version.Prerelease_Length - 1));
      end if;
      if Version.Build_Length > 0 then
         Append
           (Text, "+" & Version.Build
            (Version.Build'First .. Version.Build'First + Version.Build_Length - 1));
      end if;
      return To_String (Text);
   end Normalized;

   function Field_Text
     (Text   : String;
      Length : Natural)
      return String
   is
   begin
      if Length = 0 then
         return "";
      else
         return Text (Text'First .. Text'First + Length - 1);
      end if;
   end Field_Text;

   function Version_Label
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Version : constant Version_Info := Parse_Semver (Text);
      Label   : Unbounded_String;
   begin
      if not Version.Valid then
         return Invalid_Text;
      end if;

      Append (Label, "version " & Normalized (Version));
      if Version.Prerelease_Length > 0 then
         Append
           (Label, " prerelease "
            & Version.Prerelease
              (Version.Prerelease'First .. Version.Prerelease'First + Version.Prerelease_Length - 1));
      end if;
      if Version.Build_Length > 0 then
         Append
           (Label, " build "
            & Version.Build
              (Version.Build'First .. Version.Build'First + Version.Build_Length - 1));
      end if;
      return Ok_Text (To_String (Label));
   end Version_Label;

   procedure Version_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Version_Label (Text);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Version_Label_Into;

   function Version_Label
     (Text    : String;
      Options : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Version_Label (Text);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Versions_Surface, "version"),
         Domain_Options (Options));
   end Version_Label;

   procedure Version_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Version_Label_Options)
   is
   begin
      Copy_Result (Version_Label (Text, Options), Target, Written, Status);
   end Version_Label_Into;

   function Version_Delta
     (From_Version : String;
      To_Version   : String)
      return Version_Delta_Kind
   is
      From_Info : constant Version_Info := Parse_Semver (From_Version);
      To_Info   : constant Version_Info := Parse_Semver (To_Version);
      From_Pre  : constant String :=
        Field_Text (From_Info.Prerelease, From_Info.Prerelease_Length);
      To_Pre    : constant String :=
        Field_Text (To_Info.Prerelease, To_Info.Prerelease_Length);
      From_Build : constant String :=
        Field_Text (From_Info.Build, From_Info.Build_Length);
      To_Build : constant String :=
        Field_Text (To_Info.Build, To_Info.Build_Length);
   begin
      if not From_Info.Valid or else not To_Info.Valid then
         return Unknown_Delta;
      elsif To_Info.Major < From_Info.Major
        or else (To_Info.Major = From_Info.Major and then To_Info.Minor < From_Info.Minor)
        or else (To_Info.Major = From_Info.Major and then To_Info.Minor = From_Info.Minor
                 and then To_Info.Patch < From_Info.Patch)
      then
         return Downgrade;
      elsif To_Info.Major > From_Info.Major then
         return Major_Upgrade;
      elsif To_Info.Minor > From_Info.Minor then
         return Minor_Upgrade;
      elsif To_Info.Patch > From_Info.Patch then
         return Patch_Upgrade;
      elsif From_Pre /= To_Pre then
         return Prerelease_Change;
      elsif From_Build /= To_Build then
         return Build_Metadata_Change;
      else
         return Same_Version;
      end if;
   exception
      when Constraint_Error =>
         return Unknown_Delta;
   end Version_Delta;

   function Delta_Text (Kind : Version_Delta_Kind) return String is
   begin
      case Kind is
         when Same_Version => return "same version";
         when Major_Upgrade => return "major upgrade";
         when Minor_Upgrade => return "minor upgrade";
         when Patch_Upgrade => return "patch upgrade";
         when Prerelease_Change => return "prerelease change";
         when Build_Metadata_Change => return "build metadata change";
         when Downgrade => return "downgrade";
         when Unknown_Delta => return "unknown version change";
      end case;
   end Delta_Text;

   function Range_Text (Kind : Compatibility_Range_Kind) return String is
   begin
      case Kind is
         when Exact_Range            => return "exact version range";
         when Minimum_Range          => return "minimum version range";
         when Maximum_Range          => return "maximum version range";
         when Major_Compatible_Range => return "major compatible range";
         when Minor_Compatible_Range => return "minor compatible range";
         when Between_Range          => return "bounded version range";
         when Unknown_Range          => return "unknown version range";
      end case;
   end Range_Text;

   function Version_Delta_Suffix (Kind : Version_Delta_Kind) return String is
   begin
      return Delta_Text (Kind);
   end Version_Delta_Suffix;

   function Compatibility_Range_Suffix
     (Kind : Compatibility_Range_Kind)
      return String
   is
   begin
      return Range_Text (Kind);
   end Compatibility_Range_Suffix;

   function Version_Delta_Metadata
     (Kind : Version_Delta_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Versions_Surface,
         Version_Delta_Suffix (Kind));
   end Version_Delta_Metadata;

   function Compatibility_Range_Metadata
     (Kind : Compatibility_Range_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Versions_Surface,
         Compatibility_Range_Suffix (Kind));
   end Compatibility_Range_Metadata;

   function Version_Delta_Label
     (From_Version : String;
      To_Version   : String)
      return Humanize.Status.Text_Result
   is
      Kind : constant Version_Delta_Kind := Version_Delta (From_Version, To_Version);
   begin
      if Kind = Unknown_Delta then
         return Invalid_Text;
      end if;

      return Ok_Text
        (Version_Delta_Suffix (Kind) & ": " & Trim (From_Version)
         & " -> " & Trim (To_Version));
   end Version_Delta_Label;

   procedure Version_Delta_Label_Into
     (From_Version : String;
      To_Version   : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Version_Delta_Label (From_Version, To_Version);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Version_Delta_Label_Into;

   function Version_Delta_Label
     (From_Version : String;
      To_Version   : String;
      Options      : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      Kind : constant Version_Delta_Kind :=
        Version_Delta (From_Version, To_Version);
      Base : constant Humanize.Status.Text_Result :=
        Version_Delta_Label (From_Version, To_Version);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base, Version_Delta_Metadata (Kind), Domain_Options (Options));
   end Version_Delta_Label;

   procedure Version_Delta_Label_Into
     (From_Version : String;
      To_Version   : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Version_Label_Options)
   is
   begin
      Copy_Result
        (Version_Delta_Label (From_Version, To_Version, Options),
         Target, Written, Status);
   end Version_Delta_Label_Into;

   function Compatibility_Range_Kind_Of
     (Constraint_Text : String)
      return Compatibility_Range_Kind
   is
      Item : constant String := Trim (Constraint_Text);
   begin
      if Item'Length = 0 then
         return Unknown_Range;
      elsif Item'Length >= 2 and then Item (Item'First .. Item'First + 1) = "~>" then
         return Minor_Compatible_Range;
      elsif Item'Length >= 1 and then Item (Item'First) = '^' then
         return Major_Compatible_Range;
      elsif Item'Length >= 2 and then Item (Item'First .. Item'First + 1) = ">=" then
         if Contains (Item, ",<") then
            return Between_Range;
         else
            return Minimum_Range;
         end if;
      elsif Item'Length >= 2 and then Item (Item'First .. Item'First + 1) = "<=" then
         return Maximum_Range;
      elsif Contains (Item, "..") then
         return Between_Range;
      elsif Parse_Semver (Item).Valid then
         return Exact_Range;
      else
         return Unknown_Range;
      end if;
   end Compatibility_Range_Kind_Of;

   function Compatibility_Range_Label
     (Constraint_Text : String)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Trim (Constraint_Text);
      Kind : constant Compatibility_Range_Kind := Compatibility_Range_Kind_Of (Item);
   begin
      case Kind is
         when Exact_Range =>
            return Ok_Text ("exactly version " & Normalized (Parse_Semver (Item)));
         when Minimum_Range =>
            return Ok_Text ("version " & Item (Item'First + 2 .. Item'Last) & " or newer");
         when Maximum_Range =>
            return Ok_Text ("version " & Item (Item'First + 2 .. Item'Last) & " or older");
         when Major_Compatible_Range =>
            return Ok_Text ("compatible with major version " & Item (Item'First + 1 .. Item'Last));
         when Minor_Compatible_Range =>
            return Ok_Text ("compatible with minor version " & Trim (Item (Item'First + 2 .. Item'Last)));
         when Between_Range =>
            return Ok_Text ("version range " & Item);
         when Unknown_Range =>
            return Invalid_Text;
      end case;
   end Compatibility_Range_Label;

   function Compatibility_Range_Label
     (Constraint_Text : String;
      Options         : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      Kind : constant Compatibility_Range_Kind :=
        Compatibility_Range_Kind_Of (Constraint_Text);
      Base : constant Humanize.Status.Text_Result :=
        Compatibility_Range_Label (Constraint_Text);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base, Compatibility_Range_Metadata (Kind), Domain_Options (Options));
   end Compatibility_Range_Label;

   function Release_Label
     (Version : String)
      return Humanize.Status.Text_Result
   is
      Info : constant Version_Info := Parse_Semver (Version);
   begin
      if not Info.Valid then
         return Invalid_Text;
      elsif Info.Major = 0 then
         return Ok_Text ("initial development release " & Normalized (Info));
      elsif Info.Prerelease_Length > 0 then
         return Ok_Text ("prerelease " & Normalized (Info));
      elsif Info.Minor = 0 and then Info.Patch = 0 then
         return Ok_Text ("major release " & Normalized (Info));
      elsif Info.Patch = 0 then
         return Ok_Text ("minor release " & Normalized (Info));
      else
         return Ok_Text ("patch release " & Normalized (Info));
      end if;
   end Release_Label;

   function Release_Label
     (Version : String;
      Options : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Release_Label (Version);
   begin
      if Base.Status /= Humanize.Status.Ok then
         return Base;
      end if;

      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Versions_Surface, Result_Text (Base)),
         Domain_Options (Options));
   end Release_Label;

   function Commit_Text (Count : Natural; Word : String) return String is
   begin
      if Count = 1 then
         return "1 commit " & Word;
      else
         return Image (Count) & " commits " & Word;
      end if;
   end Commit_Text;

   function Commit_Distance_Label
     (Ahead  : Natural;
      Behind : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Ahead = 0 and then Behind = 0 then
         return Ok_Text ("up to date");
      elsif Ahead > 0 and then Behind > 0 then
         return Ok_Text (Commit_Text (Ahead, "ahead") & ", " & Commit_Text (Behind, "behind"));
      elsif Ahead > 0 then
         return Ok_Text (Commit_Text (Ahead, "ahead"));
      else
         return Ok_Text (Commit_Text (Behind, "behind"));
      end if;
   end Commit_Distance_Label;

   function Commit_Distance_Label
     (Ahead   : Natural;
      Behind  : Natural;
      Options : Version_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Commit_Distance_Label (Ahead, Behind);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base,
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Versions_Surface, Result_Text (Base)),
         Domain_Options (Options));
   end Commit_Distance_Label;

   function Parse_Version_Delta_Label
     (Text : String;
      Kind : Version_Delta_Kind)
      return Version_Label_Parse_Result
   is
      Result : Version_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Versions_Surface,
         Version_Delta_Suffix (Kind));
      Result.Metadata := Version_Delta_Metadata (Kind);
      return Result;
   end Parse_Version_Delta_Label;

   function Scan_Version_Delta_Label
     (Text : String;
      Kind : Version_Delta_Kind)
      return Version_Label_Parse_Result
   is
      Result : Version_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Versions_Surface,
         Version_Delta_Suffix (Kind));
      Result.Metadata := Version_Delta_Metadata (Kind);
      return Result;
   end Scan_Version_Delta_Label;

   function Parse_Compatibility_Range_Label
     (Text : String;
      Kind : Compatibility_Range_Kind)
      return Version_Label_Parse_Result
   is
      Result : Version_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Versions_Surface,
         Compatibility_Range_Suffix (Kind));
      Result.Metadata := Compatibility_Range_Metadata (Kind);
      return Result;
   end Parse_Compatibility_Range_Label;

   function Scan_Compatibility_Range_Label
     (Text : String;
      Kind : Compatibility_Range_Kind)
      return Version_Label_Parse_Result
   is
      Result : Version_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Versions_Surface,
         Compatibility_Range_Suffix (Kind));
      Result.Metadata := Compatibility_Range_Metadata (Kind);
      return Result;
   end Scan_Compatibility_Range_Label;

   procedure Commit_Distance_Label_Into
     (Ahead   : Natural;
      Behind  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Commit_Distance_Label (Ahead, Behind);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Commit_Distance_Label_Into;

   procedure Commit_Distance_Label_Into
     (Ahead   : Natural;
      Behind  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Version_Label_Options)
   is
   begin
      Copy_Result
        (Commit_Distance_Label (Ahead, Behind, Options), Target, Written,
         Status);
   end Commit_Distance_Label_Into;

end Humanize.Versions;
