with Ada.Characters.Handling;

with Humanize.I18N_Rendering;
with Humanize.Selections;

separate (Humanize.System_Status)
package body Localized is

   package Sel renames Humanize.Selections;

   function Key (Family, Image, Suffix : String) return String is
      Lower : constant String := Ada.Characters.Handling.To_Lower (Image);
   begin
      if Lower'Length > Suffix'Length
        and then Lower (Lower'Last - Suffix'Length + 1 .. Lower'Last) = Suffix
      then
         return "system." & Family & "." & Lower (Lower'First .. Lower'Last - Suffix'Length);
      end if;
      return "system." & Family & "." & Lower;
   end Key;

   function State_Label
     (Context : Humanize.Contexts.Context; Key : String; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Phrase_Or (Context, Sel.Phrase (Key), English));

   function Named_Label
     (Context : Humanize.Contexts.Context; Frame, Name : String; State : Humanize.Status.Text_Result;
      English : Humanize.Status.Text_Result) return Humanize.Status.Text_Result
   is
   begin
      if English.Status /= Humanize.Status.Ok or else State.Status /= Humanize.Status.Ok then
         return English;
      end if;
      return Humanize.I18N_Rendering.Phrase_Or
        (Context,
         Sel.With_Arg (Sel.With_Arg (Sel.Phrase (Frame), "name", Name), "state", To_String (State.Text)),
         English);
   end Named_Label;

   function Count_Label
     (Context : Humanize.Contexts.Context; Key : String; Count : Natural; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Phrase_Or
        (Context, Sel.With_Arg (Sel.Phrase (Key), "count", Long_Long_Integer (Count)), English));

   function Text_Label
     (Context : Humanize.Contexts.Context; Key, Argument, Value : String; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (if English.Status /= Humanize.Status.Ok then English
      else Humanize.I18N_Rendering.Phrase_Or
             (Context, Sel.With_Arg (Sel.Phrase (Key), Argument, Value), English));

   function Exit_Label
     (Context : Humanize.Contexts.Context; Code : Process_Exit_Code; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result
   is
      function Plain (Name : String) return Humanize.Status.Text_Result is
        (Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.With_Arg (Sel.Phrase ("system.exit." & Name), "code", Long_Long_Integer (Code)), English));
   begin
      case Code is
         when 0 => return Plain ("success");
         when 2 => return Plain ("usage_error");
         when 126 => return Plain ("not_executable");
         when 127 => return Plain ("not_found");
         when 128 => return Plain ("invalid_argument");
         when 129 .. 192 =>
            declare
               Signal : constant Humanize.Status.Text_Result :=
                 Signal_Label (Signal_Number (Code - 128), Include_Number => False);
            begin
               if Signal.Status /= Humanize.Status.Ok then
                  return English;
               end if;
               return Humanize.I18N_Rendering.Phrase_Or
                 (Context,
                  Sel.With_Arg
                    (Sel.With_Arg (Sel.Phrase ("system.exit.signal"), "code", Long_Long_Integer (Code)),
                     "signal", To_String (Signal.Text)),
                  English);
            end;
         when others => return Plain ("failure");
      end case;
   end Exit_Label;

end Localized;
