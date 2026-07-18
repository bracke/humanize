separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Rendered_Natural_Date_Canonical (Text : String) return String is
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Values : constant array (Positive range 1 .. 3)
        of Humanize.Datetimes.Civil_Date_Time :=
          [(Year => 2026, Month => 3, Day => 20, others => 0),
           Today,
           (Year => 2026, Month => 3, Day => 22, others => 0)];
      Item : constant String := Clean_Lower (Text);
      Runtime_Loaded : Boolean;

      function Canonical (Index : Positive) return String is
      begin
         case Index is
            when 1 => return "yesterday";
            when 2 => return "today";
            when others => return "tomorrow";
         end case;
      end Canonical;
begin
      if Item'Length = 0 then
         return Item;
      end if;

      for Locale of Humanize.Locales.Shipped_Locales loop
         declare
            Context : constant Humanize.Contexts.Context :=
              Humanize.I18N_Rendering.Default_Context
                (Locale.all, Runtime_Loaded);
         begin
            if not Runtime_Loaded then
               return Item;
            end if;

            for Index in Values'Range loop
               declare
                  Rendered : constant Humanize.Status.Text_Result :=
                    Humanize.Datetimes.Natural_Day
                      (Context, Values (Index), Today);
               begin
                  if Rendered.Status = Humanize.Status.Ok
                    and then Lower (Trim (Result_Text (Rendered))) = Item
                  then
                     return Canonical (Index);
                  end if;
               end;
            end loop;
         end;
      end loop;

      return Item;
exception
      when others => --  parse failure normalization
         return Clean_Lower (Text);
end Rendered_Natural_Date_Canonical;
