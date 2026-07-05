with Humanize.Byte_Classification;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;

with Ada.Strings.Unbounded;

package body Humanize.Bytes is

   use type Humanize.Status.Status_Code;

   function Text_Result (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => Ada.Strings.Unbounded.To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Text_Result;

   function To_String (Result : Humanize.Status.Text_Result) return String is
     (Ada.Strings.Unbounded.To_String (Result.Text));

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Text;

   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function File_Count_Label (Count : Natural) return String is
   begin
      if Count = 0 then
         return "no files";
      elsif Count = 1 then
         return "1 file";
      else
         return No_Space (Natural'Image (Count)) & " files";
      end if;
   end File_Count_Label;

   function Percent_Used
     (Used  : Byte_Count;
      Total : Byte_Count)
      return String
   is
      Whole : constant Byte_Count := Used / Total;
      Rest  : constant Byte_Count := Used mod Total;
      Rounded : constant Byte_Count :=
        Whole * 100 + (Rest * 100 + Total / 2) / Total;
   begin
      return No_Space (Byte_Count'Image (Rounded)) & "%";
   end Percent_Used;

   function Format
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Humanize.Byte_Classification.Classify (Bytes, Options);
   begin
      return Humanize.I18N_Rendering.Render (Context, Selection);
   end Format;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options)
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Humanize.Byte_Classification.Classify (Bytes, Options);
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      Humanize.I18N_Rendering.Render_Into
        (Context, Selection, Target, Written, Status);
   end Format_Into;

   function File_Size_Summary
     (Context    : Humanize.Contexts.Context;
      File_Count : Natural;
      Total      : Byte_Count;
      Options    : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Size : constant Humanize.Status.Text_Result :=
        Format (Context, Total, Options);
   begin
      if Size.Status /= Humanize.Status.Ok then
         return Size;
      end if;
      return Text_Result (File_Count_Label (File_Count) & ", " & To_String (Size));
   end File_Size_Summary;

   function Transfer_Remaining_Label
     (Context   : Humanize.Contexts.Context;
      Remaining : Byte_Count;
      Options   : Byte_Options := Auto_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Size : constant Humanize.Status.Text_Result :=
        Format (Context, Remaining, Options);
   begin
      if Size.Status /= Humanize.Status.Ok then
         return Size;
      elsif Remaining = 0 then
         return Text_Result ("transfer complete");
      else
         return Text_Result (To_String (Size) & " remaining");
      end if;
   end Transfer_Remaining_Label;

   function Transfer_Remaining_Label
     (Context          : Humanize.Contexts.Context;
      Remaining        : Byte_Count;
      Bytes_Per_Second : Byte_Count;
      Options          : Byte_Options := Auto_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Remaining_Label : constant Humanize.Status.Text_Result :=
        Transfer_Remaining_Label (Context, Remaining, Options);
      Rate : constant Humanize.Status.Text_Result :=
        Format (Context, Bytes_Per_Second, Options);
   begin
      if Remaining_Label.Status /= Humanize.Status.Ok then
         return Remaining_Label;
      elsif Rate.Status /= Humanize.Status.Ok then
         return Rate;
      elsif Remaining = 0 then
         return Remaining_Label;
      elsif Bytes_Per_Second = 0 then
         return Text_Result (To_String (Remaining_Label) & ", stalled");
      else
         return Text_Result
           (To_String (Remaining_Label) & " at " & To_String (Rate) & "/s");
      end if;
   end Transfer_Remaining_Label;

   function Disk_Usage_Label
     (Context : Humanize.Contexts.Context;
      Used    : Byte_Count;
      Total   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result
   is
      Used_Label : constant Humanize.Status.Text_Result :=
        Format (Context, Used, Options);
      Total_Label : constant Humanize.Status.Text_Result :=
        Format (Context, Total, Options);
   begin
      if Total = 0 then
         return (Status => Humanize.Status.Invalid_Value, others => <>);
      elsif Used_Label.Status /= Humanize.Status.Ok then
         return Used_Label;
      elsif Total_Label.Status /= Humanize.Status.Ok then
         return Total_Label;
      else
         return Text_Result
           (To_String (Used_Label) & " of " & To_String (Total_Label)
            & " used (" & Percent_Used (Used, Total) & ")");
      end if;
   end Disk_Usage_Label;

   procedure File_Size_Summary_Into
     (Context    : Humanize.Contexts.Context;
      File_Count : Natural;
      Total      : Byte_Count;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Byte_Options := Default_Byte_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        File_Size_Summary (Context, File_Count, Total, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result), Target, Written, Status);
      end if;
   end File_Size_Summary_Into;

   procedure Transfer_Remaining_Label_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Byte_Count;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Byte_Options := Auto_Byte_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Transfer_Remaining_Label (Context, Remaining, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result), Target, Written, Status);
      end if;
   end Transfer_Remaining_Label_Into;

   procedure Transfer_Remaining_Label_Into
     (Context          : Humanize.Contexts.Context;
      Remaining        : Byte_Count;
      Bytes_Per_Second : Byte_Count;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Byte_Options := Auto_Byte_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Transfer_Remaining_Label
          (Context, Remaining, Bytes_Per_Second, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result), Target, Written, Status);
      end if;
   end Transfer_Remaining_Label_Into;

   procedure Disk_Usage_Label_Into
     (Context : Humanize.Contexts.Context;
      Used    : Byte_Count;
      Total   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options)
   is
      Result : constant Humanize.Status.Text_Result :=
        Disk_Usage_Label (Context, Used, Total, Options);
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result), Target, Written, Status);
      end if;
   end Disk_Usage_Label_Into;

end Humanize.Bytes;
