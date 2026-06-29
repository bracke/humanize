with Ada.Strings.Unbounded;

with Humanize.Duration_Classification;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Durations is

   use Ada.Strings.Unbounded;
   use type Humanize.Status.Status_Code;

   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Result : constant Humanize.Duration_Classification.Outcome :=
        Humanize.Duration_Classification.Classify (Seconds, Options);
   begin
      case Result.Kind is
         when Humanize.Duration_Classification.Ok_Selection =>
            return Humanize.I18N_Rendering.Render (Context, Result.Selection);
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
      end case;
   end Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Duration_Classification.Outcome :=
        Humanize.Duration_Classification.Classify (Seconds, Options);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      case Result.Kind is
         when Humanize.Duration_Classification.Ok_Selection =>
            Humanize.I18N_Rendering.Render_Into
              (Context, Result.Selection, Target, Written, Status);
         when Humanize.Duration_Classification.Value_Invalid =>
            Status := Humanize.Status.Invalid_Value;
         when Humanize.Duration_Classification.Options_Invalid =>
            Status := Humanize.Status.Invalid_Options;
      end case;
   end Format_Into;

   function Format_Components
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Options        : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result
   is
      Outcome : constant Humanize.Duration_Classification.Multi_Outcome :=
        Humanize.Duration_Classification.Classify_Multi
          (Seconds, Options, Max_Components);
      Joined  : Unbounded_String;
   begin
      case Outcome.Kind is
         when Humanize.Duration_Classification.Value_Invalid =>
            return (Status => Humanize.Status.Invalid_Value, others => <>);
         when Humanize.Duration_Classification.Options_Invalid =>
            return (Status => Humanize.Status.Invalid_Options, others => <>);
         when Humanize.Duration_Classification.Ok_Selection =>
            null;
      end case;

      declare
         Parts : array (1 .. Outcome.Length) of Unbounded_String;
         --  The locale conjunction joining the final component ("and"/"og"/...).
         Conj_Result : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context, Humanize.Selections.No_Arg (Humanize.Messages.List_And));
         Conjunction : constant String :=
           (if Conj_Result.Status = Humanize.Status.Ok
            then To_String (Conj_Result.Text)
            else "and");
      begin
         for Index in 1 .. Outcome.Length loop
            declare
               Part : constant Humanize.Status.Text_Result :=
                 Humanize.I18N_Rendering.Render
                   (Context,
                    Humanize.Duration_Classification.Component_Selection
                      (Outcome.Items (Index)));
            begin
               if Part.Status /= Humanize.Status.Ok then
                  return Part;  --  propagate the first render failure
               end if;
               Parts (Index) := Part.Text;
            end;
         end loop;

         --  Join: non-final components with ", ", the last with the conjunction
         --  (for example "1 hour, 1 minute and 1 second").
         if Outcome.Length = 1 then
            Joined := Parts (1);
         else
            for Index in 1 .. Outcome.Length - 1 loop
               if Index > 1 then
                  Append (Joined, ", ");
               end if;
               Append (Joined, Parts (Index));
            end loop;
            Append (Joined, " " & Conjunction & " ");
            Append (Joined, Parts (Outcome.Length));
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Text   => Joined,
         Key    => Humanize.Messages.No_Message);
   end Format_Components;

   procedure Format_Components_Into
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Options        : Duration_Options := Default_Duration_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Format_Components (Context, Seconds, Max_Components, Options);
      Text   : constant String := To_String (Result.Text);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      if Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
         return;
      end if;

      if Text'Length > Target'Length then
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
   end Format_Components_Into;

end Humanize.Durations;
