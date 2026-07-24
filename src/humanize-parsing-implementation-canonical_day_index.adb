with Ada.Containers.Indefinite_Ordered_Maps;

with Humanize.Bounded_Text;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Canonical_Day_Index is
   use type Humanize.Status.Status_Code;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   package Day_Maps is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type => String, Element_Type => String);

   Day_Map   : Day_Maps.Map;
   Day_Ready : Boolean := False;

   --  Build the index once. Mirrors the old loop exactly -- fixed reference
   --  date, three candidate values, shipped-locale order, first rendering to
   --  claim a key wins -- so the mapping is identical. Leaves the index empty
   --  and unbuilt if the shared runtime is unavailable, matching the old
   --  behaviour of returning the input in that case (and retrying next call).
   procedure Ensure_Built is
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Values : constant array (Positive range 1 .. 3)
        of Humanize.Datetimes.Civil_Date_Time :=
          [(Year => 2026, Month => 3, Day => 20, others => 0),
           Today,
           (Year => 2026, Month => 3, Day => 22, others => 0)];
      Runtime_Loaded : Boolean;

      function Canonical_Form (Index : Positive) return String is
      begin
         case Index is
            when 1 => return "yesterday";
            when 2 => return "today";
            when others => return "tomorrow";
         end case;
      end Canonical_Form;
   begin
      if Day_Ready then
         return;
      end if;

      for Locale of Humanize.Locales.Shipped_Locales loop
         declare
            Context : constant Humanize.Contexts.Context :=
              Humanize.I18N_Rendering.Default_Context
                (Locale.all, Runtime_Loaded);
         begin
            if not Runtime_Loaded then
               return;
            end if;

            for Index in Values'Range loop
               declare
                  Rendered : constant Humanize.Status.Text_Result :=
                    Humanize.Datetimes.Natural_Day
                      (Context, Values (Index), Today);
               begin
                  if Rendered.Status = Humanize.Status.Ok then
                     declare
                        Key : constant String :=
                          Lower (Trim (Result_Text (Rendered)));
                     begin
                        if Key'Length > 0
                          and then not Day_Map.Contains (Key)
                        then
                           Day_Map.Insert (Key, Canonical_Form (Index));
                        end if;
                     end;
                  end if;
               end;
            end loop;
         end;
      end loop;

      Day_Ready := True;
   end Ensure_Built;

   function Canonical (Item : String; Found : out Boolean) return String is
   begin
      Ensure_Built;

      declare
         Position : constant Day_Maps.Cursor := Day_Map.Find (Item);
      begin
         if Day_Maps.Has_Element (Position) then
            Found := True;
            return Day_Maps.Element (Position);
         end if;
      end;

      Found := False;
      return Item;
   end Canonical;
end Humanize.Parsing.Implementation.Canonical_Day_Index;
