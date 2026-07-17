with Humanize.Strings.Support;

package body Humanize.Strings.Core is
   package Shared renames Humanize.Strings.Support;

   function Truncate
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result renames Shared.Truncate;

   function Truncate_Words
     (Text      : String;
      Max_Words : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result renames Shared.Truncate_Words;

   function Capitalize
     (Text      : String;
      Downcase  : Boolean := False)
      return Humanize.Status.Text_Result renames Shared.Capitalize;

   function Title_Case
     (Text : String)
      return Humanize.Status.Text_Result renames Shared.Title_Case;

   function Title_Case_Smart
     (Text : String)
      return Humanize.Status.Text_Result renames Shared.Title_Case_Smart;

   function Title_Case_With_Options
     (Text    : String;
      Options : Title_Case_Options := Default_Title_Case_Options)
      return Humanize.Status.Text_Result renames Shared.Title_Case_With_Options;

   function Title_Case_With_Word_Lists
     (Text        : String;
      Acronyms    : String := "";
      Small_Words : String := "")
      return Humanize.Status.Text_Result renames Shared.Title_Case_With_Word_Lists;

   function Editorial_Title
     (Text  : String;
      Style : Editorial_Title_Style := AP_Title)
      return Humanize.Status.Text_Result renames Shared.Editorial_Title;

   procedure Truncate_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...") renames Shared.Truncate_Into;

   procedure Truncate_Words_Into
     (Text      : String;
      Max_Words : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...") renames Shared.Truncate_Words_Into;

   procedure Capitalize_Into
     (Text      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Downcase  : Boolean := False) renames Shared.Capitalize_Into;

   procedure Title_Case_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Title_Case_Into;

   procedure Title_Case_Smart_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Title_Case_Smart_Into;

   procedure Title_Case_With_Options_Into
     (Text    : String;
      Options : Title_Case_Options;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Title_Case_With_Options_Into;

   procedure Title_Case_With_Word_Lists_Into
     (Text        : String;
      Acronyms    : String;
      Small_Words : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code) renames Shared.Title_Case_With_Word_Lists_Into;

   procedure Editorial_Title_Into
     (Text    : String;
      Style   : Editorial_Title_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Editorial_Title_Into;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code) renames Shared.Copy_Into;
end Humanize.Strings.Core;
