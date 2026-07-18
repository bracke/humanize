separate (Humanize.Tests.Domain_Gaps)
   procedure Test_Cross_Domain_Features
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Humanize.Cross_Domain;
      use Humanize.Domain_Details;
      Parsed : constant Feature_Label_Parse_Result :=
        Parse_Feature_Label
          ("progress import: 3 of 5 complete (60%), running");
      Scanned : constant Feature_Label_Parse_Result :=
        Scan_Feature_Label
          ("identifier uuid: 550e84...4000" & ASCII.LF & "next");
      Domain_Profile : constant Metadata_Profile :=
        Domain_Metadata_Profile
          ((Surface => Secrets_Surface, Severity => Warning_Severity,
            Tone => Caution_Tone, Final => False, Actionable => True));
      UUID_Class : constant Identifier_Classification :=
        Identifier_Kind_Of ("550e8400-e29b-41d4-a716-446655440000");
      Contact_Class : constant Contact_Profile :=
        Contact_Profile_Of ("+45 12 34 56 78");
      File_Class : constant File_Metadata_Classification :=
        File_Metadata_Kind_Of
          ("release.tar.gz", "application/gzip",
           Checksum => Checksum_Valid);
      Enum_Metadata : constant Enum_State_Metadata :=
        Enum_State_Metadata_Of ("FAILED_PAYMENT");
      Label_Profile : constant Metadata_Profile :=
        Label_Family_Profile ("contact");
      Product_Parse : constant Product_Code_Parse_Result :=
        Parse_Product_Code_Label
          ("product code ISBN-13: 978-1-4028-9462-6, checksum valid");
      Product_Scan : constant Product_Code_Parse_Result :=
        Scan_Product_Code_Label
          ("product code SKU: SKU-ABC-123, checksum not checked"
           & ASCII.LF & "next");
      Validation_Parse : constant Validation_Constraint_Parse_Result :=
        Parse_Validation_Constraint_Label
          ("validation age: must be at least 18, got 16");
      Validation_Scan : constant Validation_Constraint_Parse_Result :=
        Scan_Validation_Constraint_Label
          ("validation age: must be at least 18, got 16" & ASCII.LF
           & "trailing");
      File_Parse : constant File_Metadata_Parse_Result :=
        Parse_File_Metadata_Label
          ("file photo.png: image, 120 KB, checksum missing");
      File_Scan : constant File_Metadata_Parse_Result :=
        Scan_File_Metadata_Label
          ("file photo.png: image, 120 KB, checksum missing" & ASCII.LF
           & "next");
      Network_Parse : constant Network_Diagnostic_Parse_Result :=
        Parse_Network_Diagnostic_Label
          ("network diagnostic example.com: TLS certificate failed, "
           & "certificate expired");
      Network_Scan : constant Network_Diagnostic_Parse_Result :=
        Scan_Network_Diagnostic_Label
          ("network diagnostic example.com: TLS certificate failed, "
           & "certificate expired" & ASCII.LF & "next");
      Diff_Tree_Parse : constant Diff_Tree_Parse_Result :=
        Parse_Structured_Diff_Tree_Label
          ("diff tree settings: 3 fields changed, 1 item added, "
           & "2 items removed, 1 redacted change");
      Diff_Tree_Scan : constant Diff_Tree_Parse_Result :=
        Scan_Structured_Diff_Tree_Label
          ("diff tree settings: 3 fields changed, 1 item added, "
           & "2 items removed, 1 redacted change" & ASCII.LF & "next");
      Coverage : constant Metadata_Coverage_Summary :=
        Metadata_Coverage
          ([(Family => [others => ' '], Length => 10,
             Profile =>
               (Log_Safe => True, Privacy_Safe => True, Parseable => True,
                Bounded_Available => True, Stable => True,
                Approximate => False, Lossless => True)),
            (Family => [others => ' '], Length => 0,
             Profile =>
               (Log_Safe => True, Privacy_Safe => False, Parseable => False,
                Bounded_Available => True, Stable => True,
                Approximate => True, Lossless => False))]);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Check
        (Time_Zone_Label
           (Named_Zone, "Europe/Copenhagen", 120, Has_DST => True),
         "time zone: Europe/Copenhagen (UTC+02:00), observes daylight saving",
         "time-zone label");
      Check
        (Zoned_Time_Label
           ("2026-07-13 09:30", "CEST", 120, Ambiguous => True),
         "zoned time: 2026-07-13 09:30 CEST (UTC+02:00), "
         & "ambiguous local time",
         "zoned-time label");
      Check
        (Resolve_Time_Zone_Label
           ("Europe/Copenhagen", "2026-03-29 02:30",
            (Kind => Named_Zone, Offset_Minutes => 60, Ambiguous => False,
             Skipped => True, Has_DST => True)),
         "time zone resolution: 2026-03-29 02:30 Europe/Copenhagen => "
         & "UTC+01:00, skipped local time, daylight saving",
         "resolved time-zone label");
      Check
        (Time_Zone_Resolution_Label
           ("Europe/Copenhagen",
            (Kind => Named_Zone, Offset_Minutes => 120, Ambiguous => True,
             Skipped => False, Has_DST => True)),
         "time zone metadata Europe/Copenhagen: offset=UTC+02:00 "
         & "ambiguous=yes skipped=no dst=yes",
         "time-zone resolution metadata label");
      Check
        (Identifier_Label
           (UUID_Identifier, "550e8400-e29b-41d4-a716-446655440000"),
         "identifier uuid: 550e84...0000",
         "identifier label");
      AUnit.Assertions.Assert
        (UUID_Class.Kind = UUID_Identifier
         and then UUID_Class.Valid_Shape
         and then UUID_Class.Entropy_Hint = 122,
         "identifier classifier");
      Check
        (Auto_Identifier_Label ("01J7Y3W4S5N6P7Q8R9T0V1W2X3"),
         "identifier ulid: 01J7Y3...W2X3",
         "auto identifier label");
      Check
        (Contact_Label (Email_Contact, "ada@example.com"),
         "contact email: hidden@example.com",
         "contact label");
      AUnit.Assertions.Assert
        (Contact_Class.Kind = Phone_Contact
         and then Contact_Class.Valid_Shape
         and then Contact_Class.Visible_Tail = 4,
         "contact classifier");
      Check
        (Auto_Contact_Label ("Ada Lovelace, London"),
         "contact address: ...ndon",
         "auto contact label");
      AUnit.Assertions.Assert
        (Product_Code_Kind_Of ("978-1-4028-9462-6") = EAN_13_Code,
         "product-code classifier");
      Check
         (Product_Code_Label
           ("SKU-ABC-123", SKU_Code, Checksum => Checksum_Valid),
         "product code SKU: SKU-ABC-123, checksum valid",
         "product-code label");
      AUnit.Assertions.Assert
        (Product_Code_Checksum ("978-1-4028-9462-6", ISBN_13_Code)
           = Checksum_Valid
         and then Product_Code_Checksum ("978-1-4028-9462-0", ISBN_13_Code)
           = Checksum_Mismatch,
         "product-code checksum");
      AUnit.Assertions.Assert
        (Machine_Checksum ("79927398713", Luhn_Checksum) = Checksum_Valid
         and then Machine_Checksum ("79927398710", Luhn_Checksum)
           = Checksum_Mismatch
         and then Machine_Checksum ("GB82 WEST 1234 5698 7654 32",
                                    IBAN_Checksum) = Checksum_Valid
         and then Machine_Checksum ("US0378331005", ISIN_Checksum)
           = Checksum_Valid
         and then Machine_Checksum ("1M8GDM9AXKP042788", VIN_Checksum)
           = Checksum_Valid,
         "machine identifier checksum");
      Check
        (Machine_Checksum_Label ("GB82 WEST 1234 5698 7654 32", IBAN_Checksum),
         "machine checksum IBAN: GB82 W...4 32, checksum valid",
         "machine checksum label");
      AUnit.Assertions.Assert
        (Product_Parse.Status = Ok
         and then Product_Parse.Kind = ISBN_13_Code
         and then Product_Parse.Checksum = Checksum_Valid
         and then Product_Parse.Value_Length = 17,
         "parse product-code label");
      AUnit.Assertions.Assert
        (Product_Scan.Status = Ok
         and then Product_Scan.Consumed = 51
         and then Product_Scan.Kind = SKU_Code,
         "scan product-code label");
      Check
        (Progress_Label ("import", 3, 5),
         "progress import: 3 of 5 complete (60%), running",
         "progress label");
      Check
        (Progress_Bar_Label (3, 5, Width => 10),
         "progress bar: [######----] 60%",
         "progress bar label");
      Check
        (Collection_Summary_Label
           ("events", Total => 12, Unique => 9, Duplicates => 3,
            Outliers => 1),
         "collection events: 12 items, 9 unique values, 3 duplicates, "
         & "1 outlier",
         "collection summary label");
      Check
        (Top_Frequency_Label ("status", "failed", 4),
         "top status: failed (4 times)",
         "top frequency label");
      Check
        (Enum_Label ("HTTP_TOO_MANY_REQUESTS", Strip_Prefix => "HTTP_"),
         "enum: too many requests",
         "enum label");
      Check
        (Structured_Diff_Label
           ("settings.quota", "10 GB", "20 GB"),
         "diff settings.quota: changed from 10 GB to 20 GB",
         "structured diff label");
      Check
        (Structured_Diff_Label
           ("password", "old", "new", Redacted => True),
         "diff password: changed; values redacted",
         "redacted structured diff label");
      Check
        (Validation_Problem_Label
           ("password", Minimum_Problem, "at least 8 characters"),
         "validation password: is below minimum (at least 8 characters)",
         "validation problem label");
      Check
        (Validation_Constraint_Label
           ("age", Greater_Or_Equal, "18", Actual => "16"),
         "validation age: must be at least 18, got 16",
         "validation constraint label");
      Check
        (Validation_Result_Label
           ((Fields => 3, Errors => 2, Warnings => 1, Required => 1,
             Choices => 1, Dependencies => 0, Hidden => 1)),
         "validation result: 3 fields, 2 errors, 1 warning, "
         & "1 required field, 1 hidden problem",
         "validation result label");
      AUnit.Assertions.Assert
        (Validation_Parse.Status = Ok
         and then Validation_Parse.Relation = Greater_Or_Equal
         and then Validation_Parse.Field_Length = 3
         and then Validation_Parse.Value_Length = 2
         and then Validation_Parse.Actual_Length = 2,
         "parse validation constraint label");
      AUnit.Assertions.Assert
        (Validation_Scan.Status = Ok
         and then Validation_Scan.Consumed = 43,
         "scan validation constraint label");
      Check
        (Validation_Choice_Label
           ("role", "admin, editor, viewer", Actual => "owner"),
         "validation role: allowed values admin, editor, viewer, got owner",
         "validation choice label");
      Check
        (File_Metadata_Label
           ("release.tar.gz", Archive_File, "4.2 MB",
            "91fe1234567890"),
         "file release.tar.gz: archive, 4.2 MB, checksum 91fe12...7890",
         "file metadata label");
      AUnit.Assertions.Assert
        (File_Class.Kind = Compressed_File
         and then File_Class.Archive
         and then File_Class.Compressed
         and then File_Class.Checksum_Verified = Checksum_Valid,
         "file metadata classifier");
      Check
         (Auto_File_Metadata_Label
           ("photo.png", "image/png", "120 KB", Checksum => Checksum_Missing),
         "file photo.png: image, 120 KB, checksum missing",
         "auto file metadata label");
      Check
        (File_Signature_Label ("photo.jpg", Image_File, Plain_File),
         "file signature photo.jpg: extension says image, "
         & "content looks like file",
         "file signature label");
      AUnit.Assertions.Assert
        (File_Parse.Status = Ok
         and then File_Parse.Kind = Image_File
         and then File_Parse.Checksum = Checksum_Missing
         and then File_Parse.Name_Length = 9,
         "parse file metadata label");
      AUnit.Assertions.Assert
        (File_Scan.Status = Ok
         and then File_Scan.Consumed = 47,
         "scan file metadata label");
      Check
        (Network_Session_Label
           ("example.com", Retrying_Network, "HTTP 429", "5 seconds"),
         "network example.com: retrying, HTTP 429, retry in 5 seconds",
         "network session label");
      Check
        (Network_Diagnostic_Label
           ("example.com", TLS_Diagnostic, "certificate expired",
            "1 hour"),
         "network diagnostic example.com: TLS certificate failed, "
         & "certificate expired, retry in 1 hour",
         "network diagnostic label");
      AUnit.Assertions.Assert
        (Network_Event_Kind_Of (429) = Rate_Limited_Network
         and then Network_Event_Kind_Of (0, TLS_Failed => True)
           = TLS_Failed_Network,
         "network event classifier");
      AUnit.Assertions.Assert
        (Network_Diagnostic_Kind_Of ("DNS NXDOMAIN") = DNS_Diagnostic
         and then Network_Parse.Status = Ok
         and then Network_Parse.Kind = TLS_Diagnostic
         and then Network_Parse.Endpoint_Length = 11
         and then Network_Parse.Detail_Length = 19,
         "parse network diagnostic label");
      AUnit.Assertions.Assert
        (Network_Scan.Status = Ok
         and then Network_Scan.Consumed = 75,
         "scan network diagnostic label");
      Check
        (Terminal_Column_Label ("status", 12, Align_Right),
         "terminal column status: width 12, right aligned",
         "terminal column label");
      Check
        (Terminal_Row_Label (3, 48, Truncated => True),
         "terminal row: 3 cells, width 48, truncated",
         "terminal row label");
      Check
        (Terminal_Table_Layout_Label
           (Columns => 3, Rows => 12, Width => 80, Truncated_Cells => 2),
         "terminal table: 3 columns, 12 rows, width 80, 2 truncated cells",
         "terminal table layout label");
      Check
        (Terminal_Table_Render_Label
           ((Columns => 3, Rows => 12, Width => 80, Header => True,
             Wrapped_Cells => 1, Truncated_Cells => 2, ANSI_Aware => True)),
         "terminal render: 3 columns, 12 rows, width 80, header=yes, "
         & "ansi-aware=yes, 1 wrapped cell, 2 truncated cells",
         "terminal table render label");
      Check
        (Metadata_Profile_Label
           ("identifier",
            (Log_Safe => True, Privacy_Safe => True, Parseable => True,
             Bounded_Available => True, Stable => True, Approximate => False,
             Lossless => False)),
         "metadata identifier: log-safe=yes privacy-safe=yes parseable=yes "
         & "bounded=yes stable=yes approximate=no lossless=no",
         "metadata profile label");
      AUnit.Assertions.Assert
        (Label_Profile.Privacy_Safe
         and then Label_Profile.Approximate
         and then not Label_Profile.Lossless,
         "label family profile");
      Check
        (Metadata_Coverage_Label
           ((Total_Families => 12, Metadata_Families => 10,
             Parseable_Families => 9, Bounded_Families => 11,
             Privacy_Safe_Families => 8)),
         "metadata coverage: 10 of 12 families expose metadata, 9 parseable, "
         & "11 bounded, 8 privacy-safe",
         "metadata coverage label");
      AUnit.Assertions.Assert
        (Coverage.Total_Families = 2
         and then Coverage.Metadata_Families = 1
         and then Coverage.Parseable_Families = 1
         and then Coverage.Bounded_Families = 2
         and then Coverage.Privacy_Safe_Families = 1,
         "metadata coverage aggregation");
      AUnit.Assertions.Assert
        (Enum_Metadata.Category = Failure_State
         and then Enum_Metadata.Final
         and then Enum_Metadata.Actionable
         and then Enum_Metadata.Severity = Danger_Severity,
         "enum state metadata");
      Check
        (Enum_State_Metadata_Label ("PENDING_APPROVAL"),
         "enum metadata pending approval: category=pending final=no "
         & "actionable=no",
         "enum state metadata label");
      Check
        (Structured_Diff_Tree_Label
           ("settings", Changed_Fields => 3, Added_Items => 1,
            Removed_Items => 2, Redacted_Items => 1),
         "diff tree settings: 3 fields changed, 1 item added, "
         & "2 items removed, 1 redacted change",
         "structured diff tree label");
      Check
        (Diff_Tree_Metadata_Label
           ((Nodes => 4, Field_Nodes => 2, Object_Nodes => 1,
             List_Nodes => 1, Redacted => 1)),
         "diff metadata: 4 nodes, 2 field nodes, 1 object node, "
         & "1 list node, 1 redacted node",
         "diff tree metadata label");
      AUnit.Assertions.Assert
        (Diff_Tree_Parse.Status = Ok
         and then Diff_Tree_Parse.Root_Length = 8
         and then Diff_Tree_Parse.Changed = 3
         and then Diff_Tree_Parse.Added = 1
         and then Diff_Tree_Parse.Removed = 2
         and then Diff_Tree_Parse.Redacted = 1,
         "parse structured diff tree label");
      AUnit.Assertions.Assert
        (Diff_Tree_Scan.Status = Ok
         and then Diff_Tree_Scan.Consumed = 86,
         "scan structured diff tree label");
      Check
        (Diff_Node_Label ("roles", List_Node, 4),
         "diff node roles: list, 4 changes",
         "diff node label");
      Check
        (Contact_Field_Label
           ((Has_Name => True, Has_Email => True, Has_Phone => False,
             Has_Address => True, Has_City => False,
             Has_Postal_Code => False, Has_Country => True)),
         "contact fields: 4 fields present, 3 fields missing",
         "contact field label");
      Check
        (Contact_Field_Label
           ((Has_Name => True, Has_Email => True, Has_Phone => False,
             Has_Address => True, Has_City => False,
             Has_Postal_Code => False, Has_Country => True),
            Missing_Only => True),
         "contact fields: 3 fields missing",
         "missing contact field label");
      AUnit.Assertions.Assert
        (Parsed.Status = Ok
         and then Parsed.Kind_Length = 15
         and then Parsed.Body_Length = 30
         and then Parsed.First_Count = 3
         and then Parsed.Second_Count = 5
         and then Parsed.Percent = 60,
         "parse cross-domain feature label");
      AUnit.Assertions.Assert
        (Scanned.Status = Ok
         and then Scanned.Consumed = 30
         and then Scanned.Kind_Length = 15,
         "scan cross-domain feature label");
      AUnit.Assertions.Assert
        (not Domain_Profile.Privacy_Safe
         and then Domain_Profile.Parseable
         and then not Domain_Profile.Lossless,
         "domain metadata profile inference");
      Time_Zone_Label_Into
        (Named_Zone, Buffer, Written, Code,
         Name => "Europe/Copenhagen", Offset_Minutes => 120);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "time zone: Europ",
         "bounded time-zone label");
      Identifier_Label_Into
        (Trace_Identifier, "abcdef1234567890", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "identifier trace",
         "bounded identifier label");
      Progress_Label_Into
        ("import", 3, 5, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "progress import:",
         "bounded progress label");
      Metadata_Profile_Label_Into
        ("id",
         (Log_Safe => True, Privacy_Safe => True, Parseable => True,
          Bounded_Available => True, Stable => True, Approximate => False,
          Lossless => True),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "metadata id: log",
         "bounded metadata profile label");
      Product_Code_Label_Into
        ("SKU-ABC-123", Buffer, Written, Code, SKU_Code, Checksum_Valid);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "product code SKU",
         "bounded product-code label");
      Network_Diagnostic_Label_Into
        ("example.com", TLS_Diagnostic, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "network diagnost",
         "bounded network diagnostic label");
      Validation_Constraint_Label_Into
        ("age", Greater_Or_Equal, "18", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "validation age: ",
         "bounded validation constraint label");
      Terminal_Table_Render_Label_Into
        ((Columns => 3, Rows => 12, Width => 80, Header => True,
          Wrapped_Cells => 1, Truncated_Cells => 2, ANSI_Aware => True),
         Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 16
         and then Buffer = "terminal render:",
         "bounded terminal table render label");
   end Test_Cross_Domain_Features;
