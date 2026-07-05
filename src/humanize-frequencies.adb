with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Frequencies is
   use type Humanize.Status.Status_Code;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Text;

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
      Count_Text : constant String := Occurrence_Count'Image (Count);
      Clean      : constant String := Count_Text (Count_Text'First + 1 .. Count_Text'Last);
      Text       : constant String :=
        (case Count is
           when 0 => "never " & Plural,
           when 1 => "once " & Singular,
           when 2 => "twice " & Plural,
           when others => Clean & " " & Plural);
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
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
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
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
      Copy_Text (To_String (Result.Text), Target, Written, Status);
   end Times_Into;
end Humanize.Frequencies;
