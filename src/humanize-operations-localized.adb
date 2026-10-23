with Ada.Characters.Handling;

with Humanize.I18N_Rendering;
with Humanize.Selections;

separate (Humanize.Operations)
package body Localized is

   package Sel renames Humanize.Selections;

   function Num (S : Sel.Message_Selection; Name : String; Value : Natural) return Sel.Message_Selection is
     (Sel.With_Arg (S, Name, Long_Long_Integer (Value)));

   function State_Key (State : Operation_State) return String is
     ("operation." & Ada.Characters.Handling.To_Lower (Operation_State'Image (State)));

   function Operation_State_Label
     (Context : Humanize.Contexts.Context; State : Operation_State) return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Phrase_Or
        (Context, Sel.Phrase (State_Key (State)), Operations.Operation_State_Label (State)));

   --  One summary segment ("summary.<Name>") outside English; "" where the
   --  locale has none.
   function Segment
     (Context : Humanize.Contexts.Context; Name : String; Count, Total : Natural; Singular, Plural : String)
      return String
   is
      Text : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context,
           Humanize.I18N_Rendering.With_Nouns
             (Context, Num (Num (Sel.Phrase ("summary." & Name), "count", Count), "total", Total), Singular, Plural));
   begin
      return (if Text.Status = Humanize.Status.Ok then To_String (Text.Text) else "");
   end Segment;

   --  The operation's frame around its segments, joined by the locale's list;
   --  English where the locale is English or a part is missing.
   function Framed
     (Context : Humanize.Contexts.Context; Name : String; State : Operation_State;
      Parts : String; Missing : Boolean; English : Humanize.Status.Text_Result) return Humanize.Status.Text_Result
   is
      State_Text : constant Humanize.Status.Text_Result := Operation_State_Label (Context, State);
   begin
      if Missing or else English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         Joined : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render (Context, Sel.With_Arg (Sel.Phrase ("summary.join"), "value", Parts));
      begin
         if Joined.Status /= Humanize.Status.Ok then
            return English;
         end if;
         return Humanize.I18N_Rendering.Phrase_Or
           (Context,
            Sel.With_Arg
              (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("operation_progress"), "name", Name),
                             "state", To_String (State_Text.Text)),
               "details", To_String (Joined.Text)),
            English);
      end;
   end Framed;

   procedure Add (Parts : in out Unbounded_String; Missing : in out Boolean; Text : String) is
   begin
      if Text = "" then
         Missing := True;
      else
         if Length (Parts) > 0 then
            Append (Parts, "|");
         end if;
         Append (Parts, Text);
      end if;
   end Add;

   function Progress_Summary
     (Context : Humanize.Contexts.Context; Name : String; State : Operation_State;
      Completed, Total, Failed, Skipped, Retried, Canceled : Natural; Singular, Plural : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Operations.Progress_Summary (Name, State, Completed, Total, Failed, Skipped, Retried, Canceled,
                                     Singular, Plural);
      Parts   : Unbounded_String;
      Missing : Boolean := False;
   begin
      Add (Parts, Missing, Segment (Context, "completed_of", Completed, Total, Singular, Plural));
      if Failed > 0 then
         Add (Parts, Missing, Segment (Context, "failed", Failed, 0, Singular, Plural));
      end if;
      if Skipped > 0 then
         Add (Parts, Missing, Segment (Context, "skipped", Skipped, 0, Singular, Plural));
      end if;
      if Retried > 0 then
         Add (Parts, Missing, Segment (Context, "retried", Retried, 0, Singular, Plural));
      end if;
      if Canceled > 0 then
         Add (Parts, Missing, Segment (Context, "canceled", Canceled, 0, Singular, Plural));
      end if;
      return Framed (Context, Name, State, To_String (Parts), Missing, English);
   end Progress_Summary;

   function Unknown_Total_Summary
     (Context : Humanize.Contexts.Context; Name : String; State : Operation_State;
      Completed, Failed : Natural; Singular, Plural : String) return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Operations.Unknown_Total_Summary (Name, State, Completed, Failed, Singular, Plural);
      Parts   : Unbounded_String;
      Missing : Boolean := False;
   begin
      Add (Parts, Missing, Segment (Context, "completed", Completed, 0, Singular, Plural));
      if Failed > 0 then
         Add (Parts, Missing, Segment (Context, "failed", Failed, 0, Singular, Plural));
      end if;
      return Framed (Context, Name, State, To_String (Parts), Missing, English);
   end Unknown_Total_Summary;

   function Time_Label
     (Context : Humanize.Contexts.Context; Key, Name, Time_Text : String;
      English : Humanize.Status.Text_Result) return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Phrase_Or
        (Context, Sel.With_Arg (Sel.With_Arg (Sel.Phrase (Key), "name", Name), "time", Time_Text), English));

end Localized;
