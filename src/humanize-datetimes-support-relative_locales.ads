with Humanize.Contexts;
with Humanize.Selections;
with Humanize.Status;

private package Humanize.Datetimes.Support.Relative_Locales is
   function Slavic_Relative_Result
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result;

   function Generated_Future_Relative_Result
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result;
end Humanize.Datetimes.Support.Relative_Locales;
