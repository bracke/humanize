private package Humanize.Numbers.Editorial is
   function Editorial_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result;

   procedure Editorial_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options);

   function Editorial_Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result;

   procedure Editorial_Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options);

   function Editorial_Percent
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      return Humanize.Status.Text_Result;

   procedure Editorial_Percent_Into
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True);

   function Editorial_Measurement
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Number_Style : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;

   procedure Editorial_Measurement_Into
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Number_Style : Number_Options := Default_Number_Options);

   function Editorial_Age
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : String := "years old")
      return Humanize.Status.Text_Result;

   procedure Editorial_Age_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "years old");
end Humanize.Numbers.Editorial;
