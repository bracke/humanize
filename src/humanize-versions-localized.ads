with Humanize.Contexts;

--  Versions labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Versions.Localized is

   function Commit_Distance_Label
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Ahead As for the parent's Commit_Distance_Label.
   --  @param Behind As for the parent's Commit_Distance_Label.
   --  @return The label in Context's locale.

   function Commit_Distance_Label
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Options : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Ahead As for the parent's Commit_Distance_Label.
   --  @param Behind As for the parent's Commit_Distance_Label.
   --  @param Options As for the parent's Commit_Distance_Label.
   --  @return The label in Context's locale.

   function Compatibility_Range_Label
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Constraint_Text As for the parent's Compatibility_Range_Label.
   --  @return The label in Context's locale.

   function Compatibility_Range_Label
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String;
       Options         : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Constraint_Text As for the parent's Compatibility_Range_Label.
   --  @param Options As for the parent's Compatibility_Range_Label.
   --  @return The label in Context's locale.

   function Release_Label
      (Context : Humanize.Contexts.Context;
       Version : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Version As for the parent's Release_Label.
   --  @return The label in Context's locale.

   function Release_Label
      (Context : Humanize.Contexts.Context;
       Version : String;
       Options : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Version As for the parent's Release_Label.
   --  @param Options As for the parent's Release_Label.
   --  @return The label in Context's locale.

   function Version_Delta_Label
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param From_Version As for the parent's Version_Delta_Label.
   --  @param To_Version As for the parent's Version_Delta_Label.
   --  @return The label in Context's locale.

   function Version_Delta_Label
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String;
       Options      : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param From_Version As for the parent's Version_Delta_Label.
   --  @param To_Version As for the parent's Version_Delta_Label.
   --  @param Options As for the parent's Version_Delta_Label.
   --  @return The label in Context's locale.

   function Version_Label
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Version_Label.
   --  @return The label in Context's locale.

   function Version_Label
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Version_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Version_Label.
   --  @param Options As for the parent's Version_Label.
   --  @return The label in Context's locale.

   procedure Commit_Distance_Label_Into
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Ahead As for the parent's Commit_Distance_Label.
   --  @param Behind As for the parent's Commit_Distance_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Commit_Distance_Label_Into
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Options : Version_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Ahead As for the parent's Commit_Distance_Label.
   --  @param Behind As for the parent's Commit_Distance_Label.
   --  @param Options As for the parent's Commit_Distance_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Compatibility_Range_Label_Into
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Constraint_Text As for the parent's Compatibility_Range_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Compatibility_Range_Label_Into
      (Context         : Humanize.Contexts.Context;
       Constraint_Text : String;
       Options         : Version_Label_Options;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Constraint_Text As for the parent's Compatibility_Range_Label.
   --  @param Options As for the parent's Compatibility_Range_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Release_Label_Into
      (Context : Humanize.Contexts.Context;
       Version : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Version As for the parent's Release_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Release_Label_Into
      (Context : Humanize.Contexts.Context;
       Version : String;
       Options : Version_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Version As for the parent's Release_Label.
   --  @param Options As for the parent's Release_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Version_Delta_Label_Into
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param From_Version As for the parent's Version_Delta_Label.
   --  @param To_Version As for the parent's Version_Delta_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Version_Delta_Label_Into
      (Context      : Humanize.Contexts.Context;
       From_Version : String;
       To_Version   : String;
       Options      : Version_Label_Options;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param From_Version As for the parent's Version_Delta_Label.
   --  @param To_Version As for the parent's Version_Delta_Label.
   --  @param Options As for the parent's Version_Delta_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Version_Label_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Version_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Version_Label_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Version_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Version_Label.
   --  @param Options As for the parent's Version_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Versions.Localized;
