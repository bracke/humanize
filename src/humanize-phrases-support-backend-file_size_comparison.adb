separate (Humanize.Phrases.Support.Backend)
function File_Size_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Humanize.Bytes.Byte_Count;
      Baseline       : Humanize.Bytes.Byte_Count;
      Current_Label  : String := "file";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Bytes.Byte_Options :=
        Humanize.Bytes.Default_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Diff : Humanize.Bytes.Byte_Count;
      Size : Humanize.Status.Text_Result;
begin
      if Current = Baseline then
         return Ok_Text
           (Current_Label & " is the same size as " & Baseline_Label);
      elsif Current > Baseline then
         Diff := Current - Baseline;
         Size := Humanize.Bytes.Format (Context, Diff, Options);
         if Size.Status /= Humanize.Status.Ok then
            return Size;
         end if;
         return Ok_Text
           (Current_Label & " is " & Result_Text (Size)
            & " larger than " & Baseline_Label);
      else
         Diff := Baseline - Current;
         Size := Humanize.Bytes.Format (Context, Diff, Options);
         if Size.Status /= Humanize.Status.Ok then
            return Size;
         end if;
         return Ok_Text
           (Current_Label & " is " & Result_Text (Size)
            & " smaller than " & Baseline_Label);
      end if;
end File_Size_Comparison;
