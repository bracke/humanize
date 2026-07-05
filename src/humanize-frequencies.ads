with Humanize.Contexts;
with Humanize.Status;

--  Occurrence-count humanization ("never", "once", "twice", "3 times").
package Humanize.Frequencies is
   subtype Occurrence_Count is Long_Long_Integer range 0 .. Long_Long_Integer'Last;

   function Times
     (Context : Humanize.Contexts.Context;
      Count   : Occurrence_Count)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of occurrences.
   --  @return Human-readable occurrence count.

   function Times
     (Context  : Humanize.Contexts.Context;
      Count    : Occurrence_Count;
      Singular : String;
      Plural   : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of occurrences.
   --  @param Singular Noun used when Count is one.
   --  @param Plural Noun used for all other counts.
   --  @return Human-readable occurrence count with a custom noun.

   procedure Times_Into
     (Context : Humanize.Contexts.Context;
      Count   : Occurrence_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of occurrences.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Times_Into
     (Context  : Humanize.Contexts.Context;
      Count    : Occurrence_Count;
      Singular : String;
      Plural   : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of occurrences.
   --  @param Singular Noun used when Count is one.
   --  @param Plural Noun used for all other counts.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
end Humanize.Frequencies;
