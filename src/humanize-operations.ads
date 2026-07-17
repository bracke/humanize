with Humanize.Status;

--  Deterministic labels for queues, jobs, runs, caches, and data movement.
package Humanize.Operations is
   type Operation_State is
     (Queued, Running, Blocked, Retrying, Succeeded, Partially_Succeeded,
      Failed, Canceled, Skipped, Stale, Unknown_State);
   --  Generic operational lifecycle state.

   type Operation_Output_Mode is
     (Operation_Detailed,
      Operation_Compact,
      Operation_Accessible,
      Operation_Log);
   --  Output policy for operational progress summaries.

   type Operation_Summary_Options is record
      Mode           : Operation_Output_Mode := Operation_Detailed;
      Include_Extras : Boolean := True;
   end record;
   --  Operational summary output options.

   Default_Operation_Summary_Options : constant Operation_Summary_Options :=
     (Mode           => Operation_Detailed,
      Include_Extras => True);

   type Operation_Progress_Parse_Result is record
      Status           : Humanize.Status.Status_Code := Humanize.Status.Ok;
      State            : Operation_State := Unknown_State;
      Completed        : Natural := 0;
      Total            : Natural := 0;
      Failed           : Natural := 0;
      Skipped          : Natural := 0;
      Retried          : Natural := 0;
      Canceled         : Natural := 0;
      Consumed         : Natural := 0;
      Has_Known_Total  : Boolean := True;
   end record;
   --  Parsed metadata from a deterministic operational progress summary.

   function Operation_State_Label
     (State : Operation_State)
      return Humanize.Status.Text_Result;
   --  @param State Operational lifecycle state.
   --  @return Human-readable lifecycle label.

   function Progress_Summary
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural := 0;
      Skipped   : Natural := 0;
      Retried   : Natural := 0;
      Canceled  : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Name Queue, job, run, sync, import, export, or cache display name.
   --  @param State Operational lifecycle state.
   --  @param Completed Completed unit count.
   --  @param Total Total known unit count.
   --  @param Failed Failed unit count.
   --  @param Skipped Skipped unit count.
   --  @param Retried Retried unit count.
   --  @param Canceled Canceled unit count.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Human-readable operational progress summary.

   function Progress_Summary
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Total     : Natural;
      Failed    : Natural;
      Skipped   : Natural;
      Retried   : Natural;
      Canceled  : Natural;
      Singular  : String;
      Plural    : String;
      Options   : Operation_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Operation display name.
   --  @param State Operational lifecycle state.
   --  @param Completed Completed unit count.
   --  @param Total Total known unit count.
   --  @param Failed Failed unit count.
   --  @param Skipped Skipped unit count.
   --  @param Retried Retried unit count.
   --  @param Canceled Canceled unit count.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @param Options Operational summary output policy.
   --  @return Human-readable operational progress summary.

   function Parse_Progress_Summary
     (Text : String)
      return Operation_Progress_Parse_Result;
   --  @param Text Operational progress summary emitted by Progress_Summary.
   --  @return Parsed operational progress metadata.

   function Scan_Progress_Summary
     (Text : String)
      return Operation_Progress_Parse_Result;
   --  @param Text Text beginning with an operational progress summary.
   --  @return Parsed operational progress metadata and consumed prefix length.

   function Unknown_Total_Summary
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Name Operation display name.
   --  @param State Operational lifecycle state.
   --  @param Completed Completed unit count.
   --  @param Failed Failed unit count.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.
   --  @return Human-readable progress summary for unknown totals.

   function Last_Success_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Name Operation display name.
   --  @param Time_Text Caller-supplied time/distance label.
   --  @return Human-readable last-success label.

   function Next_Retry_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Name Operation display name.
   --  @param Time_Text Caller-supplied time/distance label.
   --  @return Human-readable next-retry label.

   function Stale_Run_Label
     (Name      : String;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Name Operation display name.
   --  @param Time_Text Caller-supplied stale duration label.
   --  @return Human-readable stale-run label.

   procedure Operation_State_Label_Into
     (State   : Operation_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Operational lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Progress_Summary_Into
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Failed    : Natural := 0;
      Skipped   : Natural := 0;
      Retried   : Natural := 0;
      Canceled  : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items");
   --  @param Name Operation display name.
   --  @param State Operational lifecycle state.
   --  @param Completed Completed unit count.
   --  @param Total Total known unit count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Failed Failed unit count.
   --  @param Skipped Skipped unit count.
   --  @param Retried Retried unit count.
   --  @param Canceled Canceled unit count.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.

   procedure Unknown_Total_Summary_Into
     (Name      : String;
      State     : Operation_State;
      Completed : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Failed    : Natural := 0;
      Singular  : String := "item";
      Plural    : String := "items");
   --  @param Name Operation display name.
   --  @param State Operational lifecycle state.
   --  @param Completed Completed unit count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Failed Failed unit count.
   --  @param Singular Singular unit noun.
   --  @param Plural Plural unit noun.

   procedure Last_Success_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Operation display name.
   --  @param Time_Text Caller-supplied time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Next_Retry_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Operation display name.
   --  @param Time_Text Caller-supplied time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Stale_Run_Label_Into
     (Name      : String;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Name Operation display name.
   --  @param Time_Text Caller-supplied stale duration label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Operations;
