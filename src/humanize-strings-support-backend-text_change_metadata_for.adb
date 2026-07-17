separate (Humanize.Strings.Support.Backend)
function Text_Change_Metadata_For
     (Old_Text : String;
      New_Text : String)
      return Text_Change_Metadata
   is
      Old_Clean : constant String := Result_Text (Squish (Old_Text));
      New_Clean : constant String := Result_Text (Squish (New_Text));
      Old_Lower : constant String := Lower_String (Old_Clean);
      New_Lower : constant String := Lower_String (New_Clean);
      Old_No_Punct : constant String := Strip_Punctuation_Key (Old_Text);
      New_No_Punct : constant String := Strip_Punctuation_Key (New_Text);
      Old_Words : constant Natural := Word_Count (Old_Text);
      New_Words : constant Natural := Word_Count (New_Text);
      Difference : Natural :=
        (if Old_Words > New_Words then Old_Words - New_Words
         else New_Words - Old_Words);
      Shared : Natural := Natural'Min (Old_Words, New_Words);
      Kind : Text_Change_Kind;
      Case_Only : constant Boolean :=
        Old_Clean /= New_Clean and then Old_Lower = New_Lower;
      Punctuation_Only : constant Boolean :=
        Old_Lower /= New_Lower and then Old_No_Punct = New_No_Punct;
begin
      if Old_Text = New_Text then
         Kind := Text_Unchanged;
         Difference := 0;
      elsif Old_Clean = New_Clean then
         Kind := Text_Whitespace_Only;
         Difference := 0;
      elsif Case_Only or else Punctuation_Only then
         Kind := Text_Minor_Edit;
         Difference := 0;
      elsif Old_Words = 0 or else New_Words = 0 then
         Kind := Text_Major_Rewrite;
         Shared := 0;
         Difference := Natural'Max (Old_Words, New_Words);
      elsif Difference <= 1 then
         Kind := Text_Minor_Edit;
      elsif Difference <= Natural'Max (2, Natural'Max (Old_Words, New_Words) / 3) then
         Kind := Text_Moderate_Edit;
      else
         Kind := Text_Major_Rewrite;
      end if;

      return
        (Kind          => Kind,
         Old_Words     => Old_Words,
         New_Words     => New_Words,
         Shared_Words  => Shared,
         Changed_Words => Difference,
         Case_Only     => Case_Only,
         Punctuation_Only => Punctuation_Only);
end Text_Change_Metadata_For;
