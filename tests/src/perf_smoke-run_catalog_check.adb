with Messages.Runtime;

with Humanize.Catalogs;

separate (Perf_Smoke)
procedure Run_Catalog_Check is
   All_Runtime, One_Runtime : Messages.Runtime.Instance;
   Loaded                   : Messages.Runtime.Load_Result;
   Start                    : constant Ada.Calendar.Time := Ada.Calendar.Clock;
   Middle                   : Ada.Calendar.Time;
begin
   Humanize.Catalogs.Load_Defaults (All_Runtime, Loaded);
   Middle := Ada.Calendar.Clock;
   Humanize.Catalogs.Load_Defaults (One_Runtime, Loaded, Locale => "de");
   Ada.Text_IO.Put_Line
     ("perf smoke catalogs: every locale in" & Duration'Image (Middle - Start) & " seconds, one language in"
      & Duration'Image (Ada.Calendar.Clock - Middle) & " seconds");
   if Middle - Start > Max_All_Catalog_Seconds then
      Error ("loading every locale's catalogs exceeded loose baseline");
   end if;
   if Ada.Calendar.Clock - Middle > Max_Language_Catalog_Seconds then
      Error ("loading one language's catalogs exceeded loose baseline");
   end if;
end Run_Catalog_Check;
