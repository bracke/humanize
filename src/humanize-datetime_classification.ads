with Ada.Calendar;
with Humanize.Datetimes;
with Humanize.Selections;

--  Pure relative-datetime rule selection. Returns a semantic message
--  selection; never localized text and never touches the i18n runtime
--  (HUM-INV-001, HUM-INV-007).
private package Humanize.Datetime_Classification is

   function Classify
     (Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Humanize.Datetimes.Datetime_Options)
      return Humanize.Selections.Message_Selection;

end Humanize.Datetime_Classification;
