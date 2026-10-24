with Humanize.Contexts;

--  Builds labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Builds.Localized is

   function Artifact_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Artifact_State_Label.
   --  @return The label in Context's locale.

   function Benchmark_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Result_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Benchmark_Label.
   --  @param Result_Text As for the parent's Benchmark_Label.
   --  @return The label in Context's locale.

   function Build_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Build_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Build_Label.
   --  @param State As for the parent's Build_Label.
   --  @return The label in Context's locale.

   function Build_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Build_State;
       Options : Build_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Build_Label.
   --  @param State As for the parent's Build_Label.
   --  @param Options As for the parent's Build_Label.
   --  @return The label in Context's locale.

   function Build_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Build_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Build_State_Label.
   --  @return The label in Context's locale.

   function Coverage_Label
      (Context      : Humanize.Contexts.Context;
       Percent_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Percent_Text As for the parent's Coverage_Label.
   --  @return The label in Context's locale.

   function Gate_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Gate_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Gate_State_Label.
   --  @return The label in Context's locale.

   function Test_Count_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       State   : Test_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Test_Count_Label.
   --  @param State As for the parent's Test_Count_Label.
   --  @return The label in Context's locale.

   function Test_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Test_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Test_State_Label.
   --  @return The label in Context's locale.

   procedure Artifact_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Artifact_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Artifact_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Benchmark_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Result_Text : String;
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Benchmark_Label.
   --  @param Result_Text As for the parent's Benchmark_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Build_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Build_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Build_Label.
   --  @param State As for the parent's Build_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Build_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Build_State;
       Options : Build_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Build_Label.
   --  @param State As for the parent's Build_Label.
   --  @param Options As for the parent's Build_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Build_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Build_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Build_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Coverage_Label_Into
      (Context      : Humanize.Contexts.Context;
       Percent_Text : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Percent_Text As for the parent's Coverage_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Gate_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Gate_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Gate_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Test_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       State   : Test_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Test_Count_Label.
   --  @param State As for the parent's Test_Count_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Test_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Test_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Test_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Builds.Localized;
