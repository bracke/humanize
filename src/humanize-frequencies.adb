with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;
with Humanize.Bounded_Text;

package body Humanize.Frequencies is
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function Times
     (Context : Humanize.Contexts.Context;
      Count   : Occurrence_Count)
      return Humanize.Status.Text_Result
   is
      use Humanize.Messages;
      Selection : Humanize.Selections.Message_Selection;
   begin
      case Count is
         when 0 =>
            Selection := Humanize.Selections.No_Arg (Frequency_Never);
         when 1 =>
            Selection := Humanize.Selections.No_Arg (Frequency_Once);
         when 2 =>
            Selection := Humanize.Selections.No_Arg (Frequency_Twice);
         when others =>
            Selection :=
              Humanize.Selections.Count
                (Frequency_Times, Humanize.Selections.Count_Value (Count));
      end case;

      return Humanize.I18N_Rendering.Render (Context, Selection);
   end Times;

   function Times
     (Context  : Humanize.Contexts.Context;
      Count    : Occurrence_Count;
      Singular : String;
      Plural   : String)
      return Humanize.Status.Text_Result
   is
      pragma Unreferenced (Context);
      Text       : constant String :=
        (case Count is
           when 0 => "never " & Plural,
           when 1 => "once " & Singular,
           when 2 => "twice " & Plural,
           when others => Integer_Text (Count) & " " & Plural);
   begin
      return Ok_Text (Text);
   end Times;

   procedure Times_Into
     (Context : Humanize.Contexts.Context;
      Count   : Occurrence_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Times (Context, Count);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Times_Into;

   procedure Times_Into
     (Context  : Humanize.Contexts.Context;
      Count    : Occurrence_Count;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Times (Context, Count, Singular, Plural);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Times_Into;
end Humanize.Frequencies;
