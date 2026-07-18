with Ada.Strings.Unbounded;
with Humanize.Contexts;
with Humanize.Status;

--  Human-readable list joining ("a, b and c").
package Humanize.Lists is
   --  Facade section: shared list and collection types, labels, and bounded output adapters.
   subtype Text_Item is Ada.Strings.Unbounded.Unbounded_String;
   type Text_List is array (Natural range <>) of Text_Item;

   type List_Style is (Conjunction, Disjunction);

   type List_Options is record
      Style        : List_Style := Conjunction;
      Oxford_Comma : Boolean := False;
   end record;

   Default_List_Options : constant List_Options :=
     (Style        => Conjunction,
      Oxford_Comma => False);

   type Collection_Display_Style is
     (Compact_Display,
      Summary_Display,
      Screen_Reader_Display);

   type Collection_Summary_Style is
     (Collection_Compact_Summary,
      Collection_Detailed_Summary,
      Collection_Accessible_Summary);

   type Collection_Display_Options is record
      Style : Collection_Display_Style := Summary_Display;
   end record;

   type Collection_Summary_Options is record
      Style          : Collection_Summary_Style := Collection_Detailed_Summary;
      Include_Total  : Boolean := True;
      Include_Hidden : Boolean := True;
   end record;

   Default_Collection_Display_Options : constant Collection_Display_Options :=
     (Style => Summary_Display);

   Default_Collection_Summary_Options : constant Collection_Summary_Options :=
     (Style          => Collection_Detailed_Summary,
      Include_Total  => True,
      Include_Hidden => True);

   type Count_Number_Style is
     (Numeric_Count,
      Word_Count,
      Compact_Count,
      Article_Count);

   type Count_Zero_Style is
     (No_Zero,
      Numeric_Zero,
      Word_Zero);

   type Count_Noun_Source is
     (Explicit_Plural,
      Default_S_Suffix,
      Irregular_Noun);

   type Counted_Noun_Options is record
      Number_Style   : Count_Number_Style := Numeric_Count;
      Zero_Style     : Count_Zero_Style := No_Zero;
      Include_Noun   : Boolean := True;
      Compact_At     : Natural := 1_000;
      Prefer_Article : Boolean := False;
   end record;

   Default_Counted_Noun_Options : constant Counted_Noun_Options :=
     (Number_Style   => Numeric_Count,
      Zero_Style     => No_Zero,
      Include_Noun   => True,
      Compact_At     => 1_000,
      Prefer_Article => False);

   type Validation_Severity is
     (Validation_Error,
      Validation_Warning,
      Validation_Info);

   type Validation_Summary_Style is
     (Validation_Headline,
      Validation_Detailed);

   subtype Validation_Detail_Limit is Natural range 0 .. 12;

   type Validation_Summary_Options is record
      Severity     : Validation_Severity := Validation_Error;
      Style        : Validation_Summary_Style := Validation_Detailed;
      Max_Details  : Validation_Detail_Limit := 3;
      Include_Ok   : Boolean := True;
      Detail_List_Options : List_Options := Default_List_Options;
   end record;

   Default_Validation_Summary_Options : constant Validation_Summary_Options :=
     (Severity            => Validation_Error,
      Style               => Validation_Detailed,
      Max_Details         => 3,
      Include_Ok          => True,
      Detail_List_Options => Default_List_Options);

   function Format
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Options : List_Options := Default_List_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Items Items to join.
   --  @param Options List style and punctuation policy.
   --  @return Human-readable joined list.

   function Format_Limited
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Limit   : Positive;
      Options : List_Options := Default_List_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Items Items to join.
   --  @param Limit Maximum original items to show before an "others" tail.
   --  @param Options List style and punctuation policy.
   --  @return Human-readable limited list.

   function Count
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Quantity Item count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Human-readable count phrase.

   function Counted_Noun
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Plural   : String := "";
      Options  : Counted_Noun_Options := Default_Counted_Noun_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Quantity Item count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @param Options Count wording, zero, article, and noun policy.
   --  @return Counted noun phrase such as "no files", "a file", or "1.2K files".

   function Counted_Noun_Source
     (Quantity : Natural;
      Singular : String;
      Plural   : String := "")
      return Count_Noun_Source;
   --  @param Quantity Item count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Metadata describing how the noun form was selected.

   function Counted_Noun_Source_Label
     (Source : Count_Noun_Source)
      return Humanize.Status.Text_Result;
   --  @param Source Noun-form source metadata.
   --  @return Stable lowercase metadata label.

   function Validation_Count
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of validation items.
   --  @param Options Severity and empty-state policy.
   --  @return Count phrase such as "no errors", "1 warning", or "3 notices".

   function Validation_Summary
     (Context : Humanize.Contexts.Context;
      Issues  : Text_List;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Issues Human-readable validation issue labels.
   --  @param Options Severity, detail limit, empty-state, and list policy.
   --  @return Summary such as "2 errors: email is invalid and 1 more".

   function Field_Problem_Summary
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Issues  : Text_List;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Field Field or input label.
   --  @param Issues Human-readable issue labels for the field.
   --  @param Options Severity, detail limit, empty-state, and list policy.
   --  @return Field-prefixed summary such as "email: 1 error: is required".

   function Selection_Count
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Selected Selected item count.
   --  @param Total Total item count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Phrase such as "3 of 5 items selected".

   function Remaining_Count
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Singular  : String;
      Plural    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Remaining Remaining item count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Phrase such as "2 items remaining" or "no items remaining".

   function Position_Count
     (Context  : Humanize.Contexts.Context;
      Position : Natural;
      Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Position Current position.
   --  @param Total Total item count.
   --  @return Phrase such as "1 of 5".

   function All_Count
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Total Total item count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Phrase such as "all 5 items".

   function None_Count
     (Context  : Humanize.Contexts.Context;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Phrase such as "no items".

   function Result_Count
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Quantity Result count.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Search/result summary such as "no results" or "24 results".

   function Showing_Count
     (Context  : Humanize.Contexts.Context;
      Showing  : Natural;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Showing Number currently shown.
   --  @param Total Total available count.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Summary such as "showing 20 of 153 results".

   function Page_Count
     (Context : Humanize.Contexts.Context;
      Page    : Natural;
      Total   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Page Current page.
   --  @param Total Total pages.
   --  @return Page summary such as "page 2 of 8".

   function More_Count
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Visible Number of visible items.
   --  @param Remaining Number of hidden items.
   --  @return Compact continuation phrase such as "3 shown, +4 more".

   function Others_Count
     (Context   : Humanize.Contexts.Context;
      First     : String;
      Remaining : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First visible item label.
   --  @param Remaining Number of other items.
   --  @return Phrase such as "Ada and 4 others".

   function Selection_Summary
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Plural   : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Selected Selected count.
   --  @param Total Total count.
   --  @param Singular Singular noun.
   --  @param Plural Optional plural noun.
   --  @return Selection phrase with none/all special cases.

   function Filtered_Count
     (Context  : Humanize.Contexts.Context;
      Matching : Natural;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Matching Number of items matching the active filter.
   --  @param Total Total available count before filtering.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Filter phrase such as "3 of 10 results match".

   function Pagination_Range
     (Context  : Humanize.Contexts.Context;
      First    : Natural;
      Last     : Natural;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First displayed item number.
   --  @param Last Last displayed item number.
   --  @param Total Total available count.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Pagination range such as "21-40 of 153 results".

   function Collection_Display
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Display_Options :=
        Default_Collection_Display_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Visible Number of visible items.
   --  @param Remaining Number of hidden items.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @param Options Collection display policy.
   --  @return Compact, summary, or screen-reader-oriented collection label.

   function Collection_Count_Label
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Singular : String := "item";
      Plural   : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Total Total collection size.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Collection count label such as "no items" or "12 items".

   function Collection_Summary
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Total     : Natural;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Summary_Options :=
        Default_Collection_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Visible Number of currently visible items.
   --  @param Total Total available collection size.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @param Options Collection summary policy.
   --  @return Collection visibility summary such as "showing 3 of 10 items".

   function Empty_Collection_Label
     (Context  : Humanize.Contexts.Context;
      Singular : String := "item";
      Plural   : String := "items")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Empty collection label such as "no items".

   function Page_Position_Label
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Page Current 1-based page.
   --  @param Total Total page count.
   --  @return Validated page label such as "page 2 of 8".

   function Page_Range_Label
     (Context  : Humanize.Contexts.Context;
      First    : Positive;
      Last     : Positive;
      Total    : Natural;
      Singular : String := "result";
      Plural   : String := "results")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param First First displayed 1-based item number.
   --  @param Last Last displayed 1-based item number.
   --  @param Total Total available count.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Validated page range such as "21-40 of 153 results".

   function Page_Navigation_Label
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Page Current 1-based page.
   --  @param Total Total page count.
   --  @return Navigation availability label for page controls.

   function Page_Size_Label
     (Context  : Humanize.Contexts.Context;
      Page_Size : Positive;
      Singular  : String := "result";
      Plural    : String := "results")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Page_Size Number of items shown per page.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @return Page-size label such as "50 results per page".

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : List_Options := Default_List_Options);
   --  @param Context Formatting context.
   --  @param Items Items to join.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options List style and punctuation policy.

   procedure Format_Limited_Into
     (Context : Humanize.Contexts.Context;
      Items   : Text_List;
      Limit   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : List_Options := Default_List_Options);
   --  @param Context Formatting context.
   --  @param Items Items to join.
   --  @param Limit Maximum original items to show before an "others" tail.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options List style and punctuation policy.

   procedure Count_Into
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "");
   --  @param Context Formatting context.
   --  @param Quantity Item count.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.

   procedure Counted_Noun_Into
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "";
      Options  : Counted_Noun_Options := Default_Counted_Noun_Options);
   --  @param Context Formatting context.
   --  @param Quantity Item count.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.
   --  @param Options Count wording, zero, article, and noun policy.

   procedure Counted_Noun_Source_Label_Into
     (Source  : Count_Noun_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Source Noun-form source metadata.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Validation_Count_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options);
   --  @param Context Formatting context.
   --  @param Count Number of validation items.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Severity and empty-state policy.

   procedure Validation_Summary_Into
     (Context : Humanize.Contexts.Context;
      Issues  : Text_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options);
   --  @param Context Formatting context.
   --  @param Issues Human-readable validation issue labels.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Severity, detail limit, empty-state, and list policy.

   procedure Field_Problem_Summary_Into
     (Context : Humanize.Contexts.Context;
      Field   : String;
      Issues  : Text_List;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Validation_Summary_Options :=
        Default_Validation_Summary_Options);
   --  @param Context Formatting context.
   --  @param Field Field or input label.
   --  @param Issues Human-readable issue labels for the field.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Severity, detail limit, empty-state, and list policy.

   procedure Selection_Count_Into
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "");
   --  @param Context Formatting context.
   --  @param Selected Selected item count.
   --  @param Total Total item count.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.

   procedure Remaining_Count_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Natural;
      Singular  : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Plural    : String := "");
   --  @param Context Formatting context.
   --  @param Remaining Remaining item count.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.

   procedure Position_Count_Into
     (Context  : Humanize.Contexts.Context;
      Position : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Position Current position.
   --  @param Total Total item count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure All_Count_Into
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "");
   --  @param Context Formatting context.
   --  @param Total Total item count.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.

   procedure None_Count_Into
     (Context  : Humanize.Contexts.Context;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "");
   --  @param Context Formatting context.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.

   procedure Result_Count_Into
     (Context  : Humanize.Contexts.Context;
      Quantity : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results");
   --  @param Context Formatting context.
   --  @param Quantity Result count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Showing_Count_Into
     (Context  : Humanize.Contexts.Context;
      Showing  : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results");
   --  @param Context Formatting context.
   --  @param Showing Number currently shown.
   --  @param Total Total available count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Page_Count_Into
     (Context : Humanize.Contexts.Context;
      Page    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Page Current page.
   --  @param Total Total pages.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure More_Count_Into
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Visible Number of visible items.
   --  @param Remaining Number of hidden items.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Others_Count_Into
     (Context   : Humanize.Contexts.Context;
      First     : String;
      Remaining : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param First First visible item label.
   --  @param Remaining Number of other items.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Selection_Summary_Into
     (Context  : Humanize.Contexts.Context;
      Selected : Natural;
      Total    : Natural;
      Singular : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Plural   : String := "");
   --  @param Context Formatting context.
   --  @param Selected Selected count.
   --  @param Total Total count.
   --  @param Singular Singular noun.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Plural Optional plural noun.

   procedure Filtered_Count_Into
     (Context  : Humanize.Contexts.Context;
      Matching : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results");
   --  @param Context Formatting context.
   --  @param Matching Number of items matching the active filter.
   --  @param Total Total available count before filtering.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Pagination_Range_Into
     (Context  : Humanize.Contexts.Context;
      First    : Natural;
      Last     : Natural;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results");
   --  @param Context Formatting context.
   --  @param First First displayed item number.
   --  @param Last Last displayed item number.
   --  @param Total Total available count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Collection_Display_Into
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Remaining : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Display_Options :=
        Default_Collection_Display_Options);
   --  @param Context Formatting context.
   --  @param Visible Number of visible items.
   --  @param Remaining Number of hidden items.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @param Options Collection display policy.

   procedure Collection_Count_Label_Into
     (Context  : Humanize.Contexts.Context;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "item";
      Plural   : String := "items");
   --  @param Context Formatting context.
   --  @param Total Total collection size.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Collection_Summary_Into
     (Context   : Humanize.Contexts.Context;
      Visible   : Natural;
      Total     : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "item";
      Plural    : String := "items";
      Options   : Collection_Summary_Options :=
        Default_Collection_Summary_Options);
   --  @param Context Formatting context.
   --  @param Visible Number of currently visible items.
   --  @param Total Total available collection size.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
   --  @param Options Collection summary policy.

   procedure Empty_Collection_Label_Into
     (Context  : Humanize.Contexts.Context;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "item";
      Plural   : String := "items");
   --  @param Context Formatting context.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Page_Position_Label_Into
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Page Current 1-based page.
   --  @param Total Total page count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Page_Range_Label_Into
     (Context  : Humanize.Contexts.Context;
      First    : Positive;
      Last     : Positive;
      Total    : Natural;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Singular : String := "result";
      Plural   : String := "results");
   --  @param Context Formatting context.
   --  @param First First displayed 1-based item number.
   --  @param Last Last displayed 1-based item number.
   --  @param Total Total available count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.

   procedure Page_Navigation_Label_Into
     (Context : Humanize.Contexts.Context;
      Page    : Positive;
      Total   : Positive;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Page Current 1-based page.
   --  @param Total Total page count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Page_Size_Label_Into
     (Context   : Humanize.Contexts.Context;
      Page_Size : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singular  : String := "result";
      Plural    : String := "results");
   --  @param Context Formatting context.
   --  @param Page_Size Number of items shown per page.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Singular Singular noun.
   --  @param Plural Plural noun.
end Humanize.Lists;
