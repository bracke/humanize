with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Characters.Handling;

with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Rates is
   use type Humanize.Status.Status_Code;

   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function Language (Context : Humanize.Contexts.Context) return String is
      Locale : constant String := Humanize.Contexts.Locale (Context);
      Last   : Natural := Locale'Last;
   begin
      for Index in Locale'Range loop
         if Locale (Index) = '-' or else Locale (Index) = '_' then
            Last := Index - 1;
            exit;
         end if;
      end loop;

      return Ada.Characters.Handling.To_Lower (Locale (Locale'First .. Last));
   end Language;

   function Standard_Rate_Period
     (Lang   : String;
      Period : Rate_Period)
      return String
   is
   begin
      if Lang = "tr" then
         case Period is
            when Per_Second => return "saniyede";
            when Per_Minute => return "dakikada";
            when Per_Hour   => return "saatte";
            when Per_Day    => return B ("67C3BC6E6465");
            when Per_Week   => return "haftada";
         end case;
      elsif Lang = "ja" then
         case Period is
            when Per_Second => return B ("E6AF8EE7A792");
            when Per_Minute => return B ("E6AF8EE58886");
            when Per_Hour   => return B ("E6AF8EE69982");
            when Per_Day    => return B ("E6AF8EE697A5");
            when Per_Week   => return B ("E6AF8EE980B1");
         end case;
      elsif Lang = "ko" then
         case Period is
            when Per_Second => return B ("ECB488EB8BB9");
            when Per_Minute => return B ("EBB684EB8BB9");
            when Per_Hour   => return B ("EC8B9CEAB084EB8BB9");
            when Per_Day    => return B ("EC9DBCEB8BB9");
            when Per_Week   => return B ("ECA3BCEB8BB9");
         end case;
      elsif Lang = "zh" then
         case Period is
            when Per_Second => return B ("E6AF8FE7A792");
            when Per_Minute => return B ("E6AF8FE58886E9929F");
            when Per_Hour   => return B ("E6AF8FE5B08FE697B6");
            when Per_Day    => return B ("E6AF8FE5A4A9");
            when Per_Week   => return B ("E6AF8FE591A8");
         end case;
      elsif Lang = "hi" then
         case Period is
            when Per_Second =>
               return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1");
            when Per_Minute =>
               return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4AEE0A4BFE0A4A8E0A49F");
            when Per_Hour =>
               return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE");
            when Per_Day =>
               return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4A6E0A4BFE0A4A8");
            when Per_Week =>
               return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9");
         end case;
      else
         return "";
      end if;
   end Standard_Rate_Period;

   function Standard_Rate_Result
     (Context   : Humanize.Contexts.Context;
      Count     : Humanize.Frequencies.Occurrence_Count;
      Period    : Rate_Period;
      Less_Than : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Lang : constant String := Language (Context);
   begin
      if not (Lang = "tr" or else Lang = "ja" or else Lang = "ko"
              or else Lang = "zh" or else Lang = "hi")
      then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      declare
         Period_Text : constant String := Standard_Rate_Period (Lang, Period);
         Count_Text  : constant String :=
           No_Space
             (Humanize.Frequencies.Occurrence_Count'Image (Count));
         Text        : constant String :=
           (if Lang = "tr" then
              (if Less_Than then Period_Text & " bir kezden az"
               else Period_Text & " " & B ("79616B6C61C59FC4B16B")
                 & " " & Count_Text & " kez")
            elsif Lang = "ja" then
              (if Less_Than then Period_Text & " 1 " & B ("E59B9EE69CAAE6BA80")
               else Period_Text & B ("E7B484") & " " & Count_Text
                 & " " & B ("E59B9E"))
            elsif Lang = "ko" then
              (if Less_Than then Period_Text & " 1" & B ("EBB288")
                 & " " & B ("EBAFB8EBA78C")
               else Period_Text & " " & B ("EC95BD") & " " & Count_Text
                 & B ("EBB288"))
            elsif Lang = "zh" then
              (if Less_Than then Period_Text & B ("E5B091E4BA8E203120E6ACA1")
               else Period_Text & B ("E7BAA6") & " " & Count_Text
                 & " " & B ("E6ACA1"))
            else
              (if Less_Than then Period_Text & " "
                 & B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B020E0A4B8E0A58720E0A495E0A4AE")
               else Period_Text & " " & B ("E0A4B2E0A497E0A4ADE0A497")
                 & " " & Count_Text & " " & B ("E0A4ACE0A4BEE0A4B0")));
      begin
         if Period_Text'Length = 0 then
            return (Status => Humanize.Status.Runtime_Error, others => <>);
         end if;

         return
           (Status => Humanize.Status.Ok,
            Text   => To_Unbounded_String (Text),
            Key    => Humanize.Messages.No_Message);
      end;
   end Standard_Rate_Result;

   function Key_For (Period : Rate_Period) return Humanize.Messages.Message_Id is
   begin
      case Period is
         when Per_Second => return Humanize.Messages.Rate_Per_Second;
         when Per_Minute => return Humanize.Messages.Rate_Per_Minute;
         when Per_Hour   => return Humanize.Messages.Rate_Per_Hour;
         when Per_Day    => return Humanize.Messages.Rate_Per_Day;
         when Per_Week   => return Humanize.Messages.Rate_Per_Week;
      end case;
   end Key_For;

   function Less_Key_For
     (Period : Rate_Period)
      return Humanize.Messages.Message_Id
   is
   begin
      case Period is
         when Per_Second => return Humanize.Messages.Rate_Less_Than_Per_Second;
         when Per_Minute => return Humanize.Messages.Rate_Less_Than_Per_Minute;
         when Per_Hour   => return Humanize.Messages.Rate_Less_Than_Per_Hour;
         when Per_Day    => return Humanize.Messages.Rate_Less_Than_Per_Day;
         when Per_Week   => return Humanize.Messages.Rate_Less_Than_Per_Week;
      end case;
   end Less_Key_For;

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

   function Pace
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period)
      return Humanize.Status.Text_Result
   is
      Frequency : constant Humanize.Status.Text_Result :=
        Humanize.Frequencies.Times (Context, Count);
   begin
      declare
         Direct : constant Humanize.Status.Text_Result :=
           Standard_Rate_Result (Context, Count, Period);
      begin
         if Direct.Status = Humanize.Status.Ok then
            return Direct;
         end if;
      end;

      if Frequency.Status /= Humanize.Status.Ok then
         return Frequency;
      end if;

      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Text_Value
           (Key_For (Period), To_String (Frequency.Text)));
   end Pace;

   function Pace_Approximate
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period;
      Options : Rate_Options := Default_Rate_Options)
      return Humanize.Status.Text_Result
   is
      Frequency : constant Humanize.Status.Text_Result :=
        Humanize.Frequencies.Times (Context, Options.Less_Than_Threshold);
   begin
      if Count < Options.Less_Than_Threshold then
         declare
            Direct : constant Humanize.Status.Text_Result :=
              Standard_Rate_Result
                (Context, Options.Less_Than_Threshold, Period, True);
         begin
            if Direct.Status = Humanize.Status.Ok then
               return Direct;
            end if;
         end;

         if Frequency.Status /= Humanize.Status.Ok then
            return Frequency;
         end if;
         return Humanize.I18N_Rendering.Render
           (Context,
            Humanize.Selections.Text_Value
              (Less_Key_For (Period), To_String (Frequency.Text)));
      else
         return Pace (Context, Count, Period);
      end if;
   end Pace_Approximate;

   function Pace
     (Context  : Humanize.Contexts.Context;
      Count    : Humanize.Frequencies.Occurrence_Count;
      Period   : Rate_Period;
      Singular : String;
      Plural   : String)
      return Humanize.Status.Text_Result
   is
      Frequency : constant Humanize.Status.Text_Result :=
        Humanize.Frequencies.Times (Context, Count, Singular, Plural);
   begin
      if Frequency.Status /= Humanize.Status.Ok then
         return Frequency;
      end if;

      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.Text_Value
           (Key_For (Period), To_String (Frequency.Text)));
   end Pace;

   function Pace_Approximate
     (Context  : Humanize.Contexts.Context;
      Count    : Humanize.Frequencies.Occurrence_Count;
      Period   : Rate_Period;
      Singular : String;
      Plural   : String;
      Options  : Rate_Options := Default_Rate_Options)
      return Humanize.Status.Text_Result
   is
      Frequency : constant Humanize.Status.Text_Result :=
        Humanize.Frequencies.Times
          (Context, Options.Less_Than_Threshold, Singular, Plural);
   begin
      if Count < Options.Less_Than_Threshold then
         if Frequency.Status /= Humanize.Status.Ok then
            return Frequency;
         end if;
         return Humanize.I18N_Rendering.Render
           (Context,
            Humanize.Selections.Text_Value
              (Less_Key_For (Period), To_String (Frequency.Text)));
      else
         return Pace (Context, Count, Period, Singular, Plural);
      end if;
   end Pace_Approximate;

   procedure Pace_Into
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Pace (Context, Count, Period);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Pace_Into;

   procedure Pace_Approximate_Into
     (Context : Humanize.Contexts.Context;
      Count   : Humanize.Frequencies.Occurrence_Count;
      Period  : Rate_Period;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Rate_Options := Default_Rate_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Pace_Approximate (Context, Count, Period, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Pace_Approximate_Into;

   procedure Pace_Into
     (Context  : Humanize.Contexts.Context;
      Count    : Humanize.Frequencies.Occurrence_Count;
      Period   : Rate_Period;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Pace (Context, Count, Period, Singular, Plural);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Pace_Into;
end Humanize.Rates;
