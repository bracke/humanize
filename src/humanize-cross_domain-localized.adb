with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Selections;

package body Humanize.Cross_Domain.Localized is

   use type Humanize.Status.Status_Code;

   package Sel renames Humanize.Selections;

   function Trim (Text : String) return String is (Ada.Strings.Fixed.Trim (Text, Ada.Strings.Both));

   function Num (S : Sel.Message_Selection; Name : String; Value : Natural) return Sel.Message_Selection is
     (Sel.With_Arg (S, Name, Long_Long_Integer (Value)));

   --  "<family>." & the enumeration value, Prefix and Suffix dropped.
   function Key (Family, Image, Prefix, Suffix : String) return String is
      Lower : constant String := Ada.Characters.Handling.To_Lower (Image);
      First : Positive := Lower'First;
      Last  : Natural := Lower'Last;
   begin
      if Prefix /= "" and then Lower'Length > Prefix'Length
        and then Lower (First .. First + Prefix'Length - 1) = Prefix
      then
         First := First + Prefix'Length;
      end if;
      if Suffix /= "" and then Last - First + 1 > Suffix'Length
        and then Lower (Last - Suffix'Length + 1 .. Last) = Suffix
      then
         Last := Last - Suffix'Length;
      end if;
      return Family & "." & Lower (First .. Last);
   end Key;

   --  Text rendered from Selection; "" where the locale has none.
   function Part (Context : Humanize.Contexts.Context; Selection : Sel.Message_Selection) return String is
      Rendered : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Selection);
   begin
      return (if Rendered.Status = Humanize.Status.Ok then To_String (Rendered.Text) else "");
   end Part;

   --  Text in the frame Frame with Argument; Text where Value is empty, ""
   --  where Text is.
   function Framed (Context : Humanize.Contexts.Context; Text, Frame, Argument, Value : String) return String is
     (if Text = "" or else Value = "" then Text
      else Part (Context, Sel.With_Arg (Sel.With_Arg (Sel.Phrase (Frame), "text", Text), Argument, Value)));

   --  The localized text, or English where the locale is English, a part is
   --  missing, or English itself failed.
   function Choose
     (Context : Humanize.Contexts.Context; Text : String; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result
   is
   begin
      if English.Status /= Humanize.Status.Ok or else Text = ""
        or else Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | ""
      then
         return English;
      end if;
      return (Status => Humanize.Status.Ok, Text => To_Unbounded_String (Text), Key => English.Key);
   end Choose;

   function Validation_Problem_Label
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String := "")
      return Humanize.Status.Text_Result
   is
      Text : constant String :=
        Part (Context, Sel.With_Arg (Sel.Phrase (Key ("validation.problem", Kind'Image, "", "_problem")), "field",
                                     Trim (Field)));
   begin
      return Choose (Context, Framed (Context, Text, "frame.detail", "detail", Trim (Detail)),
                     Validation_Problem_Label (Field, Kind, Detail));
   end Validation_Problem_Label;

   function Validation_Constraint_Label
     (Context  : Humanize.Contexts.Context;
      Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String := "")
      return Humanize.Status.Text_Result
   is
      Text : constant String :=
        Part (Context,
              Sel.With_Arg (Sel.With_Arg (Sel.Phrase (Key ("validation.constraint", Relation'Image, "", "")),
                                          "field", Trim (Field)), "value", Trim (Value)));
   begin
      return Choose (Context, Framed (Context, Text, "frame.got", "actual", Trim (Actual)),
                     Validation_Constraint_Label (Field, Relation, Value, Actual));
   end Validation_Constraint_Label;

   function Validation_Choice_Label
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Choices : String;
      Actual  : String := "")
      return Humanize.Status.Text_Result
   is
      Text : constant String :=
        Part (Context, Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("validation.choices"), "field", Trim (Field)),
                                     "choices", Trim (Choices)));
   begin
      return Choose (Context, Framed (Context, Text, "frame.got", "actual", Trim (Actual)),
                     Validation_Choice_Label (Field, Choices, Actual));
   end Validation_Choice_Label;

   function Network_Diagnostic_Label
     (Context     : Humanize.Contexts.Context;
      Endpoint    : String;
      Kind        : Network_Diagnostic_Kind;
      Detail      : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result
   is
      Text : constant String :=
        Part (Context, Sel.With_Arg (Sel.Phrase (Key ("net_diagnostic", Kind'Image, "", "_diagnostic")),
                                     "endpoint", Trim (Endpoint)));
   begin
      return Choose
        (Context,
         Framed (Context, Framed (Context, Text, "frame.also", "detail", Trim (Detail)), "frame.retry", "time",
                 Trim (Retry_After)),
         Network_Diagnostic_Label (Endpoint, Kind, Detail, Retry_After));
   end Network_Diagnostic_Label;

   function Progress_Label
     (Context : Humanize.Contexts.Context;
      Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State := Progress_Running)
      return Humanize.Status.Text_Result
   is
      State_Text : constant String := Part (Context, Sel.Phrase (Key ("progress.state", State'Image, "progress_", "")));
      Percent    : constant Natural := (if Total = 0 then 0 else Natural'Min (100, Done * 100 / Total));
      Frame      : constant Sel.Message_Selection :=
        Sel.With_Arg (Sel.With_Arg (Sel.Phrase (if Total = 0 then "progress.done" else "progress.of"), "subject",
                                    Trim (Subject)), "state", State_Text);
   begin
      return Choose
        (Context,
         (if State_Text = "" then ""
          else Part (Context, Num (Num (Num (Frame, "done", Done), "total", Total), "percent", Percent))),
         Progress_Label (Subject, Done, Total, State));
   end Progress_Label;

   function Collection_Summary_Label
     (Context    : Humanize.Contexts.Context;
      Name       : String;
      Total      : Natural;
      Unique     : Natural := 0;
      Duplicates : Natural := 0;
      Outliers   : Natural := 0)
      return Humanize.Status.Text_Result
   is (Choose
         (Context,
          Part (Context,
                Num (Num (Num (Num (Sel.With_Arg (Sel.Phrase ("collection.summary"), "name", Trim (Name)), "total",
                                    Total), "unique", Unique), "duplicates", Duplicates), "outliers", Outliers)),
          Collection_Summary_Label (Name, Total, Unique, Duplicates, Outliers)));

   function Top_Frequency_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      Value   : String;
      Count   : Natural)
      return Humanize.Status.Text_Result
   is (Choose
         (Context,
          Part (Context,
                Num (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("top_frequency"), "name", Trim (Name)), "value",
                                   Trim (Value)), "count", Count)),
          Top_Frequency_Label (Name, Value, Count)));

   procedure Validation_Problem_Label_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Validation_Problem_Label (Context, Field, Kind, Detail),
         Target, Written, Status);
   end Validation_Problem_Label_Into;

   procedure Validation_Constraint_Label_Into
     (Context  : Humanize.Contexts.Context;
      Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Validation_Constraint_Label (Context, Field, Relation, Value, Actual),
         Target, Written, Status);
   end Validation_Constraint_Label_Into;

   procedure Validation_Choice_Label_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Choices : String;
      Actual  : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Validation_Choice_Label (Context, Field, Choices, Actual),
         Target, Written, Status);
   end Validation_Choice_Label_Into;

   procedure Network_Diagnostic_Label_Into
     (Context     : Humanize.Contexts.Context;
      Endpoint    : String;
      Kind        : Network_Diagnostic_Kind;
      Detail      : String;
      Retry_After : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Network_Diagnostic_Label (Context, Endpoint, Kind, Detail, Retry_After),
         Target, Written, Status);
   end Network_Diagnostic_Label_Into;

   procedure Progress_Label_Into
     (Context : Humanize.Contexts.Context;
      Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Progress_Label (Context, Subject, Done, Total, State), Target, Written, Status);
   end Progress_Label_Into;

   procedure Collection_Summary_Label_Into
     (Context    : Humanize.Contexts.Context;
      Name       : String;
      Total      : Natural;
      Unique     : Natural;
      Duplicates : Natural;
      Outliers   : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Collection_Summary_Label (Context, Name, Total, Unique, Duplicates, Outliers),
         Target, Written, Status);
   end Collection_Summary_Label_Into;

   procedure Top_Frequency_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      Value   : String;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Top_Frequency_Label (Context, Name, Value, Count), Target, Written, Status);
   end Top_Frequency_Label_Into;

end Humanize.Cross_Domain.Localized;
