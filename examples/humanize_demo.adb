with Ada.Calendar;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Numbers;
with Humanize.Status;
with Humanize.Units;

with Humanize_Demo_Runtime;

--  Minimal end-to-end Humanize example: load the built-in catalog into an
--  application-owned I18N runtime and humanize a few values in English and
--  Danish. Run from the repository root:  ./examples/bin/humanize_demo
procedure Humanize_Demo is
   use Ada.Calendar;
   use Ada.Text_IO;

   function Text (Result : Humanize.Status.Text_Result) return String is
     (Ada.Strings.Unbounded.To_String (Result.Text));

   Loaded    : I18N.Runtime.Load_Result;
   Reference : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
   Earlier   : constant Time := Reference - Duration (14_400);  --  4 hours
begin
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded);

   declare
      English : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "en");
      Danish  : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "da-DK");
      Spanish : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Humanize_Demo_Runtime.Runtime'Access, "es");
   begin
      Put_Line ("English:");
      Put_Line
        ("  duration 90s : "
         & Text (Humanize.Durations.Format (English, 90)));
      Put_Line
        ("  bytes 1536   : "
         & Text (Humanize.Bytes.Format (English, 1536)));
      Put_Line
        ("  4 hours ago  : "
         & Text (Humanize.Datetimes.Relative (English, Earlier, Reference)));
      New_Line;
      Put_Line ("Danish:");
      Put_Line
        ("  duration 90s : "
         & Text (Humanize.Durations.Format (Danish, 90)));
      Put_Line
        ("  bytes 1536   : "
         & Text (Humanize.Bytes.Format (Danish, 1536)));
      Put_Line
        ("  4 hours ago  : "
         & Text (Humanize.Datetimes.Relative (Danish, Earlier, Reference)));
      New_Line;
      Put_Line ("Numbers / multi-unit (English):");
      Put_Line
        ("  ordinal 21   : "
         & Text (Humanize.Numbers.Ordinal (English, 21)));
      Put_Line
        ("  compact 1.2M : "
         & Text (Humanize.Numbers.Compact (English, 1_200_000)));
      Put_Line
        ("  3661 seconds : "
         & Text (Humanize.Durations.Format_Components (English, 3661, 3)));
      Put_Line
        ("  5 kilometers : "
         & Text (Humanize.Units.Format (English, 5, Humanize.Units.Kilometer)));
      New_Line;
      Put_Line ("Spanish:");
      Put_Line
        ("  bytes 1536   : "
         & Text (Humanize.Bytes.Format (Spanish, 1536)));
      Put_Line
        ("  4 hours ago  : "
         & Text (Humanize.Datetimes.Relative (Spanish, Earlier, Reference)));
      Put_Line
        ("  3 kilometers : "
         & Text (Humanize.Units.Format (Spanish, 3, Humanize.Units.Kilometer)));
   end;
end Humanize_Demo;
