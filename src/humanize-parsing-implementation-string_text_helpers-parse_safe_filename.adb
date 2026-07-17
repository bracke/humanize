separate (Humanize.Parsing.Implementation.String_Text_Helpers)
function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Dot : Natural := 0;
      Safe : Boolean := Item'Length > 0;
      Buffer : String (1 .. 160);
      Buffer_Length : Natural;
      Ext_Buffer : String (1 .. 32);
      Ext_Length : Natural := 0;
      Stem_Length : Natural := 0;
      Ext_Lower : Boolean := False;
      Ext_Upper : Boolean := False;
      Reserved : Boolean := False;
      Sep : Character := ASCII.NUL;
      Sep_Count : Natural := 0;
begin
      for Index in Item'Range loop
         declare
            Ch : constant Character := Item (Index);
         begin
            if Ch = '/' or else Ch = '\' or else Ch = ASCII.NUL
              or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
              or else Ch = ASCII.CR
            then
               Safe := False;
            elsif not (Is_Alnum (Ch)
                       or else Ch = '.'
                       or else Ch = '-'
                       or else Ch = '_')
            then
               Safe := False;
            end if;

            if Ch = '.' and then Index > Item'First then
               Dot := Index;
            elsif Ch = '-' or else Ch = '_' then
               Sep_Count := Sep_Count + 1;
               if Sep = ASCII.NUL then
                  Sep := Ch;
               end if;
            end if;
         end;
      end loop;

      if Item'Length > 0
        and then (Item (Item'Last) = '.' or else Item (Item'Last) = '-'
                  or else Item (Item'Last) = '_')
      then
         Safe := False;
      end if;

      Store (Item, Buffer, Buffer_Length);
      if Dot /= 0 and then Dot < Item'Last then
         Store (Item (Dot + 1 .. Item'Last), Ext_Buffer, Ext_Length);
         Stem_Length := Dot - Item'First;
         Ext_Lower := Lowercase_Label (Item (Dot + 1 .. Item'Last));
         Ext_Upper := Uppercase_Label (Item (Dot + 1 .. Item'Last));
      else
         Store ("", Ext_Buffer, Ext_Length);
         Stem_Length := Item'Length;
      end if;

      declare
         Stem : constant String :=
           (if Dot /= 0 and then Dot > Item'First
            then Item (Item'First .. Dot - 1)
            else Item);
         Stem_Low : constant String := Lower (Stem);
      begin
         Reserved :=
           Stem_Low = "con" or else Stem_Low = "prn"
           or else Stem_Low = "aux" or else Stem_Low = "nul"
           or else Stem_Low = "com1" or else Stem_Low = "com2"
           or else Stem_Low = "com3" or else Stem_Low = "com4"
           or else Stem_Low = "com5" or else Stem_Low = "com6"
           or else Stem_Low = "com7" or else Stem_Low = "com8"
           or else Stem_Low = "com9" or else Stem_Low = "lpt1"
           or else Stem_Low = "lpt2" or else Stem_Low = "lpt3"
           or else Stem_Low = "lpt4" or else Stem_Low = "lpt5"
           or else Stem_Low = "lpt6" or else Stem_Low = "lpt7"
           or else Stem_Low = "lpt8" or else Stem_Low = "lpt9";
      end;

      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Buffer_Length,
         Stem_Length => Stem_Length,
         Has_Extension => Ext_Length > 0,
         Extension => Ext_Buffer,
         Extension_Length => Ext_Length,
         Hidden => Item'Length > 1 and then Item (Item'First) = '.',
         Looks_Safe => Safe,
         Extension_Lowercase => Ext_Lower,
         Extension_Uppercase => Ext_Upper,
         Reserved_Name => Reserved,
         Separator => Sep,
         Separator_Count => Sep_Count,
         Extension_Preserved => Ext_Length > 0,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
end Parse_Safe_Filename;
