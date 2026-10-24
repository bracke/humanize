separate (Humanize.Tests.Numbers.Test_Cardinal_Fractional)
   --  Round ordinals: Ukrainian glues the multiplier's stem on (compounds too),
   --  German glues the count on the millionth, Lithuanian has a few, Russian 200 .. 900
   --  are ordinals (CLDR 48 gives the cardinal), Polish keeps the numeral for a
   --  compound multiplier, and thousands agree in gender and number.
   procedure Check_Round_Ordinals is
      procedure Check (Locale : String; Value : Natural; Want : String) is
         Got : constant String := Support.Text (Ordinal_Words (Support.Locale (Locale), Value));
      begin
         AUnit.Assertions.Assert (Got = Want, Locale & Value'Image & " ordinal: " & Got);
      end Check;
   begin
      Check ("uk", 300, Support.U (16#442#) & Support.U (16#440#) & Support.U (16#44C#) & Support.U (16#43E#)
             & Support.U (16#445#) & Support.U (16#441#) & Support.U (16#43E#) & Support.U (16#442#)
             & Support.U (16#438#) & Support.U (16#439#));
      Check ("uk", 2_300, Support.U (16#434#) & Support.U (16#432#) & Support.U (16#456#) & " "
             & Support.U (16#442#) & Support.U (16#438#) & Support.U (16#441#) & Support.U (16#44F#)
             & Support.U (16#447#) & Support.U (16#456#) & " " & Support.U (16#442#) & Support.U (16#440#)
             & Support.U (16#44C#) & Support.U (16#43E#) & Support.U (16#445#) & Support.U (16#441#)
             & Support.U (16#43E#) & Support.U (16#442#) & Support.U (16#438#) & Support.U (16#439#));
      Check ("uk", 5_000, Support.U (16#43F#) & Support.U (16#2019#) & Support.U (16#44F#)
             & Support.U (16#442#) & Support.U (16#438#) & Support.U (16#442#) & Support.U (16#438#)
             & Support.U (16#441#) & Support.U (16#44F#) & Support.U (16#447#) & Support.U (16#43D#)
             & Support.U (16#438#) & Support.U (16#439#));
      Check ("uk", 22_001, Support.U (16#434#) & Support.U (16#432#) & Support.U (16#430#)
             & Support.U (16#434#) & Support.U (16#446#) & Support.U (16#44F#) & Support.U (16#442#)
             & Support.U (16#44C#) & " " & Support.U (16#434#) & Support.U (16#432#) & Support.U (16#456#)
             & " " & Support.U (16#442#) & Support.U (16#438#) & Support.U (16#441#) & Support.U (16#44F#)
             & Support.U (16#447#) & Support.U (16#456#) & " " & Support.U (16#43F#) & Support.U (16#435#)
             & Support.U (16#440#) & Support.U (16#448#) & Support.U (16#438#) & Support.U (16#439#));
      Check ("ru", 300, Support.U (16#442#) & Support.U (16#440#) & Support.U (16#435#) & Support.U (16#445#)
             & Support.U (16#441#) & Support.U (16#43E#) & Support.U (16#442#) & Support.U (16#44B#)
             & Support.U (16#439#));
      Check ("ru", 2_300, Support.U (16#434#) & Support.U (16#432#) & Support.U (16#435#) & " "
             & Support.U (16#442#) & Support.U (16#44B#) & Support.U (16#441#) & Support.U (16#44F#)
             & Support.U (16#447#) & Support.U (16#438#) & " " & Support.U (16#442#) & Support.U (16#440#)
             & Support.U (16#435#) & Support.U (16#445#) & Support.U (16#441#) & Support.U (16#43E#)
             & Support.U (16#442#) & Support.U (16#44B#) & Support.U (16#439#));
      Check ("pl", 3_000, "trzytysi" & Support.U (16#119#) & "czny");
      Check ("uk", 22_000, Support.U (16#434#) & Support.U (16#432#) & Support.U (16#430#)
             & Support.U (16#434#) & Support.U (16#446#) & Support.U (16#44F#) & Support.U (16#442#)
             & Support.U (16#438#) & Support.U (16#434#) & Support.U (16#432#) & Support.U (16#43E#)
             & Support.U (16#445#) & Support.U (16#442#) & Support.U (16#438#) & Support.U (16#441#)
             & Support.U (16#44F#) & Support.U (16#447#) & Support.U (16#43D#) & Support.U (16#438#)
             & Support.U (16#439#));
      Check ("uk", 21_000, Support.U (16#434#) & Support.U (16#432#) & Support.U (16#430#)
             & Support.U (16#434#) & Support.U (16#446#) & Support.U (16#44F#) & Support.U (16#442#)
             & Support.U (16#438#) & Support.U (16#43E#) & Support.U (16#434#) & Support.U (16#43D#)
             & Support.U (16#43E#) & Support.U (16#442#) & Support.U (16#438#) & Support.U (16#441#)
             & Support.U (16#44F#) & Support.U (16#447#) & Support.U (16#43D#) & Support.U (16#438#)
             & Support.U (16#439#));
      Check ("de", 2_000_000, "zwei" & Support.U (16#AD#) & "millionste");
      Check ("de", 1_000_000, "millionste");
      Check ("lt", 200, "dvi" & Support.U (16#161#) & "imtasis");
      Check ("lt", 2_000, "dvit" & Support.U (16#16B#) & "kstantasis");
   end Check_Round_Ordinals;
