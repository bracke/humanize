--  Display-width aware string helpers for terminal and UI presentation.
package Humanize.Strings.Display is
   function UTF8_Length
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Count of UTF-8 code points, treating invalid bytes as one unit.

   function UTF8_Display_Width
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Approximate monospace display width.

   function Grapheme_Length
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Count of extended grapheme clusters, treating invalid bytes as one unit.

   function Grapheme_Display_Width
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text.
   --  @return Approximate monospace width by grapheme cluster.

   function ANSI_Display_Width
     (Text : String)
      return Natural;
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @return Approximate monospace width ignoring ANSI escape sequences.

   function Truncate_UTF8
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return UTF-8 boundary-safe truncated text.

   function UTF8_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based code point to include.
   --  @param Last_Char Last 1-based code point to include.
   --  @return UTF-8 boundary-safe slice.

   function Truncate_UTF8_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return UTF-8 boundary-safe truncation at a word boundary when possible.

   function Truncate_Graphemes
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Grapheme-cluster-safe truncated text.

   function Truncate_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Grapheme-safe text truncated by approximate display width.

   function Truncate_ANSI_Display_Width
     (Text      : String;
      Max_Width : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return ANSI-preserving grapheme-safe text truncated by display width.

   function Wrap_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Indent Spaces to prepend after inserted line breaks.
   --  @return Grapheme-safe text wrapped by approximate display width.

   function Wrap_ANSI_Display_Width
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Indent Spaces to prepend after inserted line breaks.
   --  @return ANSI-preserving grapheme-safe text wrapped by display width.

   function Wrap_ANSI_Display_Width_Styled
     (Text      : String;
      Max_Width : Positive;
      Indent    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text that may contain ANSI SGR escapes.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Indent Spaces to prepend after inserted line breaks.
   --  @return ANSI-aware wrapped text that reopens active SGR styles after breaks.

   function Key_Value_Line
     (Key       : String;
      Value     : String;
      Separator : String := ": ")
      return Humanize.Status.Text_Result;
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Separator Text between key and value.
   --  @return Single key/value terminal line.

   function Aligned_Key_Value_Line
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Separator : String := " : ")
      return Humanize.Status.Text_Result;
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Key_Width Minimum display width for the key.
   --  @param Separator Text between key and value.
   --  @return Single aligned key/value terminal line.

   function Table_Row_2
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Separator  : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left Left cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Separator Text between cells.
   --  @return ANSI-aware two-column terminal row.

   function Table_Row_3
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left Left cell text.
   --  @param Middle Middle cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Middle_Width Minimum display width for the middle cell.
   --  @param Separator Text between cells.
   --  @return ANSI-aware three-column terminal row.

   function Table_2
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Separator    : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left_Column Left column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Separator Text between cells.
   --  @return Newline-separated ANSI-aware two-column terminal table.

   function Table_3
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Separator     : String := "  ")
      return Humanize.Status.Text_Result;
   --  @param Left_Column Left column cells.
   --  @param Middle_Column Middle column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Middle_Width Minimum display width for the middle column.
   --  @param Separator Text between cells.
   --  @return Newline-separated ANSI-aware three-column terminal table.

   function Grapheme_Slice
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based grapheme cluster to include.
   --  @param Last_Char Last 1-based grapheme cluster to include.
   --  @return Grapheme-cluster-safe slice.

   function Truncate_Grapheme_Words
     (Text      : String;
      Max_Chars : Natural;
      Ellipsis  : String := "...")
      return Humanize.Status.Text_Result;
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Ellipsis Suffix used when truncating.
   --  @return Grapheme-safe truncation at a word boundary when possible.

   procedure Truncate_UTF8_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure UTF8_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based code point to include.
   --  @param Last_Char Last 1-based code point to include.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Truncate_UTF8_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output code-point length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_Graphemes_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Truncate_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width including Ellipsis.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Ellipsis Suffix used when truncating.

   procedure Wrap_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0);
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Indent Spaces to prepend after inserted line breaks.

   procedure Wrap_ANSI_Display_Width_Into
     (Text      : String;
      Max_Width : Positive;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Indent    : Natural := 0);
   --  @param Text UTF-8-compatible input text that may contain ANSI escapes.
   --  @param Max_Width Maximum monospace display width for each output line.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Indent Spaces to prepend after inserted line breaks.

   procedure Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := ": ");
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between key and value.

   procedure Aligned_Key_Value_Line_Into
     (Key       : String;
      Value     : String;
      Key_Width : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Separator : String := " : ");
   --  @param Key Display key.
   --  @param Value Display value.
   --  @param Key_Width Minimum display width for the key.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between key and value.

   procedure Table_Row_2_Into
     (Left       : String;
      Right      : String;
      Left_Width : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Separator  : String := "  ");
   --  @param Left Left cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

   procedure Table_Row_3_Into
     (Left         : String;
      Middle       : String;
      Right        : String;
      Left_Width   : Natural;
      Middle_Width : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ");
   --  @param Left Left cell text.
   --  @param Middle Middle cell text.
   --  @param Right Right cell text.
   --  @param Left_Width Minimum display width for the left cell.
   --  @param Middle_Width Minimum display width for the middle cell.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

   procedure Table_2_Into
     (Left_Column  : Name_List;
      Right_Column : Name_List;
      Left_Width   : Natural;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Separator    : String := "  ");
   --  @param Left_Column Left column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

   procedure Table_3_Into
     (Left_Column   : Name_List;
      Middle_Column : Name_List;
      Right_Column  : Name_List;
      Left_Width    : Natural;
      Middle_Width  : Natural;
      Target        : in out String;
      Written       : out Natural;
      Status        : out Humanize.Status.Status_Code;
      Separator     : String := "  ");
   --  @param Left_Column Left column cells.
   --  @param Middle_Column Middle column cells.
   --  @param Right_Column Right column cells.
   --  @param Left_Width Minimum display width for the left column.
   --  @param Middle_Width Minimum display width for the middle column.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Separator Text between cells.

   procedure Grapheme_Slice_Into
     (Text       : String;
      First_Char : Positive;
      Last_Char  : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code);
   --  @param Text UTF-8-compatible input text.
   --  @param First_Char First 1-based grapheme cluster to include.
   --  @param Last_Char Last 1-based grapheme cluster to include.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Truncate_Grapheme_Words_Into
     (Text      : String;
      Max_Chars : Natural;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Ellipsis  : String := "...");
   --  @param Text UTF-8-compatible input text.
   --  @param Max_Chars Maximum output grapheme-cluster length including Ellipsis.
end Humanize.Strings.Display;
