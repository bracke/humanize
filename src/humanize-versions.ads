with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for versions, releases, and compatibility ranges.
package Humanize.Versions is

   subtype Version_Number is Natural;

   type Version_Info is record
      Major : Version_Number := 0;
      Minor : Version_Number := 0;
      Patch : Version_Number := 0;
      Has_Minor : Boolean := False;
      Has_Patch : Boolean := False;
      Prerelease : String (1 .. 64) := [others => ' '];
      Prerelease_Length : Natural := 0;
      Build : String (1 .. 64) := [others => ' '];
      Build_Length : Natural := 0;
      Valid : Boolean := False;
   end record;
   --  Parsed SemVer-like version metadata.

   type Version_Delta_Kind is
     (Same_Version,
      Major_Upgrade,
      Minor_Upgrade,
      Patch_Upgrade,
      Prerelease_Change,
      Build_Metadata_Change,
      Downgrade,
      Unknown_Delta);
   --  Version comparison category.

   type Compatibility_Range_Kind is
     (Exact_Range,
      Minimum_Range,
      Maximum_Range,
      Major_Compatible_Range,
      Minor_Compatible_Range,
      Between_Range,
      Unknown_Range);
   --  Display category for simple version constraints.

   type Version_Output_Mode is
     (Version_Detailed,
      Version_Compact,
      Version_Accessible,
      Version_Log);
   --  Output display policy for version labels.

   type Version_Label_Options is record
      Mode             : Version_Output_Mode := Version_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;
   --  Domain-label options for version labels.

   Default_Version_Label_Options : constant Version_Label_Options :=
     (Mode             => Version_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Version_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;
   --  Parsed version label with name and state spans.

   function Parse_Semver
     (Text : String)
      return Version_Info;
   --  @param Text SemVer-like version text.
   --  @return Parsed version metadata, with Valid False when unsupported.

   function Version_Label
     (Text : String)
      return Humanize.Status.Text_Result;
   --  @param Text SemVer-like version text.
   --  @return Human-readable version label.

   function Version_Label
     (Text    : String;
      Options : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Text SemVer-like version text.
   --  @param Options Domain-label output options.
   --  @return Version label with optional version metadata.

   procedure Version_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Text SemVer-like version text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Version_Label_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Version_Label_Options);
   --  @param Text SemVer-like version text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.

   function Version_Delta
     (From_Version : String;
      To_Version   : String)
      return Version_Delta_Kind;
   --  @param From_Version Original SemVer-like version.
   --  @param To_Version New SemVer-like version.
   --  @return Version change category.

   function Version_Delta_Label
     (From_Version : String;
      To_Version   : String)
      return Humanize.Status.Text_Result;
   --  @param From_Version Original SemVer-like version.
   --  @param To_Version New SemVer-like version.
   --  @return Human-readable version change label.

   function Version_Delta_Label
     (From_Version : String;
      To_Version   : String;
      Options      : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param From_Version Original SemVer-like version.
   --  @param To_Version New SemVer-like version.
   --  @param Options Domain-label output options.
   --  @return Version change label with optional version metadata.

   procedure Version_Delta_Label_Into
     (From_Version : String;
      To_Version   : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param From_Version Original SemVer-like version.
   --  @param To_Version New SemVer-like version.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Version_Delta_Label_Into
     (From_Version : String;
      To_Version   : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Options      : Version_Label_Options);
   --  @param From_Version Original SemVer-like version.
   --  @param To_Version New SemVer-like version.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.

   function Compatibility_Range_Label
     (Constraint_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Constraint_Text Simple version range such as ">=1.4,<2" or "~>1.2".
   --  @return Human-readable compatibility range label.

   function Compatibility_Range_Label
     (Constraint_Text : String;
      Options         : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Constraint_Text Simple version range such as ">=1.4,<2" or "~>1.2".
   --  @param Options Domain-label output options.
   --  @return Compatibility range label with optional version metadata.

   function Compatibility_Range_Kind_Of
     (Constraint_Text : String)
      return Compatibility_Range_Kind;
   --  @param Constraint_Text Simple version range.
   --  @return Detected display category for Constraint_Text.

   function Release_Label
     (Version : String)
      return Humanize.Status.Text_Result;
   --  @param Version SemVer-like version text.
   --  @return Human-readable release label.

   function Release_Label
     (Version : String;
      Options : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Version SemVer-like version text.
   --  @param Options Domain-label output options.
   --  @return Release label with optional version metadata.

   function Commit_Distance_Label
     (Ahead  : Natural;
      Behind : Natural)
      return Humanize.Status.Text_Result;
   --  @param Ahead Number of commits ahead.
   --  @param Behind Number of commits behind.
   --  @return Human-readable repository distance label.

   function Commit_Distance_Label
     (Ahead   : Natural;
      Behind  : Natural;
      Options : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Ahead Number of commits ahead.
   --  @param Behind Number of commits behind.
   --  @param Options Domain-label output options.
   --  @return Repository distance label with optional version metadata.

   function Version_Delta_Metadata
     (Kind : Version_Delta_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Version comparison category.
   --  @return Stable metadata for the version delta.

   function Compatibility_Range_Metadata
     (Kind : Compatibility_Range_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Compatibility range category.
   --  @return Stable metadata for the compatibility range.

   function Parse_Version_Delta_Label
     (Text : String;
      Kind : Version_Delta_Kind)
      return Version_Label_Parse_Result;
   --  @param Text Label in "name version-delta" form.
   --  @param Kind Expected version delta.
   --  @return Parsed label spans and version metadata.

   function Scan_Version_Delta_Label
     (Text : String;
      Kind : Version_Delta_Kind)
      return Version_Label_Parse_Result;
   --  @param Text Text beginning with a "name version-delta" label.
   --  @param Kind Expected version delta.
   --  @return Parsed prefix label spans and version metadata.

   function Parse_Compatibility_Range_Label
     (Text : String;
      Kind : Compatibility_Range_Kind)
      return Version_Label_Parse_Result;
   --  @param Text Label in "name compatibility-range" form.
   --  @param Kind Expected compatibility range category.
   --  @return Parsed label spans and version metadata.

   function Scan_Compatibility_Range_Label
     (Text : String;
      Kind : Compatibility_Range_Kind)
      return Version_Label_Parse_Result;
   --  @param Text Text beginning with a "name compatibility-range" label.
   --  @param Kind Expected compatibility range category.
   --  @return Parsed prefix label spans and version metadata.

   procedure Commit_Distance_Label_Into
     (Ahead   : Natural;
      Behind  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Ahead Number of commits ahead.
   --  @param Behind Number of commits behind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Commit_Distance_Label_Into
     (Ahead   : Natural;
      Behind  : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Version_Label_Options);
   --  @param Ahead Number of commits ahead.
   --  @param Behind Number of commits behind.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Domain-label output options.

end Humanize.Versions;
