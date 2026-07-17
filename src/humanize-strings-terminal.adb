with Humanize.Strings.Support;

package body Humanize.Strings.Terminal is
   package Shared renames Humanize.Strings.Support;

   function Terminal_Paragraph
     (Text         : String;
      Width        : Positive;
      Prefix       : String := "";
      Continuation : String := "")
      return Humanize.Status.Text_Result renames Shared.Terminal_Paragraph;

   function Terminal_Bullet_List
     (Items  : Name_List;
      Width  : Positive;
      Bullet : String := "- ")
      return Humanize.Status.Text_Result renames Shared.Terminal_Bullet_List;

   function Terminal_Section
     (Title   : String;
      Content : String;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result renames Shared.Terminal_Section;

   function Terminal_Key_Value_Block
     (Keys    : Name_List;
      Values  : Name_List;
      Options : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result renames Shared.Terminal_Key_Value_Block;

   function Terminal_Status_Block
     (Status_Label : String;
      Detail       : String := "";
      Options      : Terminal_Layout_Options := Default_Terminal_Layout_Options)
      return Humanize.Status.Text_Result renames Shared.Terminal_Status_Block;

   procedure Terminal_Paragraph_Into
     (Text         : String;
      Width        : Positive;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Prefix       : String := "";
      Continuation : String := "") renames Shared.Terminal_Paragraph_Into;
end Humanize.Strings.Terminal;
