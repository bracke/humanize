with Humanize.Contexts;

--  Media labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"): each
--  is the parent's function of the same name with a Context first, and that function itself in English, where the
--  locale has no translation, and for every input the parent rejects.
package Humanize.Media.Localized is

   function Duration_Label
      (Context       : Humanize.Contexts.Context;
       Duration_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Duration_Text As for the parent's Duration_Label.
   --  @return The label in Context's locale.

   function Media_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Media_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Media_Kind_Label.
   --  @return The label in Context's locale.

   function Media_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Media_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Media_State_Label.
   --  @return The label in Context's locale.

   function Media_Summary
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Media_Summary.
   --  @param Kind As for the parent's Media_Summary.
   --  @param State As for the parent's Media_Summary.
   --  @return The label in Context's locale.

   function Media_Summary
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State;
       Options : Media_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Media_Summary.
   --  @param Kind As for the parent's Media_Summary.
   --  @param State As for the parent's Media_Summary.
   --  @param Options As for the parent's Media_Summary.
   --  @return The label in Context's locale.

   function Page_Count_Label
      (Context : Humanize.Contexts.Context;
       Pages   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Pages As for the parent's Page_Count_Label.
   --  @return The label in Context's locale.

   function Resolution_Label
      (Context : Humanize.Contexts.Context;
       Width   : Positive;
       Height  : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Width As for the parent's Resolution_Label.
   --  @param Height As for the parent's Resolution_Label.
   --  @return The label in Context's locale.

   procedure Duration_Label_Into
      (Context       : Humanize.Contexts.Context;
       Duration_Text : String;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Duration_Text As for the parent's Duration_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Media_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Media_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Media_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Media_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_Summary_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Media_Summary.
   --  @param Kind As for the parent's Media_Summary.
   --  @param State As for the parent's Media_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Media_Summary_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Media_Kind;
       State   : Media_State;
       Options : Media_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Media_Summary.
   --  @param Kind As for the parent's Media_Summary.
   --  @param State As for the parent's Media_Summary.
   --  @param Options As for the parent's Media_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Page_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Pages   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Pages As for the parent's Page_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Resolution_Label_Into
      (Context : Humanize.Contexts.Context;
       Width   : Positive;
       Height  : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Width As for the parent's Resolution_Label.
   --  @param Height As for the parent's Resolution_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Media.Localized;
