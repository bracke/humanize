with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Resources;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Resources is
   use Humanize.Resources;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Utilization (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Custom : constant Utilization_Options :=
        (Low_Threshold => 10.0, High_Threshold => 70.0, Critical_Threshold => 90.0);
      Invalid : constant Text_Result := Utilization_Label (1, 0, "slots");
   begin
      AUnit.Assertions.Assert
        (Utilization_Band_Of (0, 100) = Empty_Utilization
         and then Utilization_Band_Of (5, 100) = Low_Utilization
         and then Utilization_Band_Of (50, 100) = Normal_Utilization
         and then Utilization_Band_Of (80, 100) = High_Utilization
         and then Utilization_Band_Of (95, 100) = Critical_Utilization
         and then Utilization_Band_Of (100, 100) = Full_Utilization
         and then Utilization_Band_Of (101, 100) = Over_Limit_Utilization
         and then Utilization_Band_Of (75, 100, Custom) = High_Utilization,
         "utilization band classification");

      Check (Utilization_Band_Label (Critical_Utilization), "critical utilization", "band label");
      Check
        (Utilization_Label (83, 100, "slots"),
         "83 of 100 slots used (83%, high utilization)", "utilization label");
      Check
        (Utilization_Label (101, 100, "slots"),
         "101 of 100 slots used (101%, over limit)", "over limit utilization label");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Value,
         "zero total utilization is invalid");
   end Test_Utilization;

   procedure Test_Quota_Remaining_And_Availability
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid_Available : constant Text_Result := Availability_Label (4, 3);
   begin
      Check
        (Remaining_Label (70, 100, "requests"),
         "30 of 100 requests remaining", "remaining label");
      Check
        (Remaining_Label (120, 100, "requests"),
         "20 requests over capacity", "over capacity label");
      Check
        (Quota_Label (50, 100, "requests"),
         "quota available: 50 requests remaining (50% used)", "quota available");
      Check
        (Quota_Label (93, 100, "requests"),
         "quota near limit: 7 requests remaining (93% used)", "quota near limit");
      Check
        (Quota_Label (125, 100, "requests"),
         "quota exceeded by 25 requests (125% used)", "quota exceeded");
      Check
        (Availability_Label (3, 5),
         "3 of 5 replicas available, 2 unavailable", "partial availability");
      Check
        (Availability_Label (5, 5),
         "5 of 5 replicas available", "full availability");
      Check
        (Availability_Label (0, 3),
         "no replicas available", "no availability");
      Check
        (Availability_Label (1, 1, "node", "nodes"),
         "1 of 1 node available", "singular availability");
      AUnit.Assertions.Assert
        (Invalid_Available.Status = Invalid_Value,
         "available greater than total is invalid");
   end Test_Quota_Remaining_And_Availability;

   procedure Test_Rates_And_Saturation (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Saturation_Detailed : constant Text_Result :=
        Saturation_Label
          ("CPU", 97.0,
           Resource_Label_Options'
             (Mode             => Resource_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Saturation : constant Resource_Label_Parse_Result :=
        Parse_Saturation_Label
          ("CPU 97% critical utilization", Critical_Utilization);
      Scanned_Saturation : constant Resource_Label_Parse_Result :=
        Scan_Saturation_Label
          ("CPU 97% critical utilization trailing", Critical_Utilization);
   begin
      Check
        (Cache_Hit_Rate_Label (92, 8),
         "cache hit rate 92%: 92 hits, 8 misses", "cache hit rate");
      Check
        (Cache_Hit_Rate_Label (0, 0),
         "cache hit rate unavailable: no requests", "empty cache hit rate");
      Check
        (Saturation_Label ("CPU", 97.0),
         "CPU 97% critical utilization", "critical saturation");
      Check
        (Saturation_Detailed,
         "[resources danger] CPU 97% critical utilization",
         "saturation option metadata");
      AUnit.Assertions.Assert
        (Parsed_Saturation.Status = Ok
         and then Parsed_Saturation.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Saturation.Name_Length = 7,
         "parse saturation metadata");
      AUnit.Assertions.Assert
        (Scanned_Saturation.Status = Ok
         and then Scanned_Saturation.Consumed = 28,
         "scan saturation prefix");
      Check
        (Saturation_Label ("", 0.0),
         "resource 0% empty", "unnamed saturation");
   end Test_Rates_And_Saturation;

   procedure Test_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer : String (1 .. 44);
      Tiny   : String (1 .. 12);
      Offset : String (2 .. 16);
      Written : Natural;
      Code : Status_Code;
   begin
      Utilization_Label_Into (83, 100, Buffer, Written, Code, Unit => "slots");
      AUnit.Assertions.Assert
        (Code = Ok
         and then Written = 44
         and then Buffer = "83 of 100 slots used (83%, high utilization)",
         "utilization bounded exact");

      Quota_Label_Into (125, 100, Tiny, Written, Code, Unit => "requests");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 12 and then Tiny = "quota exceed",
         "quota bounded overflow");

      Availability_Label_Into (1, 3, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "availability bounded rejects non-1-based buffer");

      Saturation_Label_Into
        ("CPU", 97.0, Tiny, Written, Code,
         Resource_Label_Options'
           (Mode             => Resource_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 12
         and then Tiny = "[resources d",
         "saturation option bounded overflow");
   end Test_Bounded;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize resource tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Utilization'Access, "utilization labels");
      Register_Routine
        (T, Test_Quota_Remaining_And_Availability'Access,
         "quota remaining and availability labels");
      Register_Routine (T, Test_Rates_And_Saturation'Access, "rate and saturation labels");
      Register_Routine (T, Test_Bounded'Access, "bounded resource labels");
   end Register_Tests;

end Humanize.Tests.Resources;
