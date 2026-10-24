separate (Humanize.Catalogs.Phrase_Data.Locale_Sw)
procedure Labels_4 is
begin
   P ("label.palettes.palette_harmony_label.monochrome_palette", "paleti ya rangi moja");
   P ("label.palettes.palette_summary.mostly_black", "kwa kiasi kikubwa nyeusi");
   P ("label.palettes.palette_summary.mostly_yellow", "kwa kiasi kikubwa njano");
   P ("label.palettes.palette_summary.mostly_maroon", "kwa kiasi kikubwa maruni");
   P ("label.palettes.palette_summary.mostly_white", "kwa kiasi kikubwa nyeupe");
   P ("label.palettes.palette_summary.mostly_orange", "kwa kiasi kikubwa rangi ya chungwa");
   P ("label.palettes.palette_summary.mostly_fuchsia", "kwa kiasi kikubwa fuksia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "paleti ya kati");
   P ("label.palettes.palette_summary.mostly_red", "kwa kiasi kikubwa nyekundu");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {neno 1} other {maneno {v1, number}}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {sentensi 1} other {sentensi {v1, number}}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, plural, one {aya 1} other {aya {v1, number}}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {dakika 1 ya kusoma} other {dakika {v1, number} za "
      & "kusoma}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {dakika 1 ya kuzungumza} other {dakika {v1, number} "
      & "za kuzungumza}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {neno 1} other {maneno {v1, number}}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {sentensi 1} other {sentensi {v1, number}}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, plural, one {aya 1} other {aya {v1, number}}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {dakika 1 ya kusoma} other {dakika {v1, number} za "
      & "kusoma}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, plural, one {aya 1} other {aya {v1, number}}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "chini ya {v1, plural, one {dakika 1 ya kusoma} other {dakika {v1, "
      & "number} za kusoma}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "chini ya {v1, plural, one {dakika 1 ya kuzungumza} other {dakika {v1, "
      & "number} za kuzungumza}}");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, plural, one {aya 1} other {aya {v1, number}}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "chini ya {v1, plural, one {dakika 1 ya kusoma} other {dakika {v1, "
      & "number} za kusoma}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {sentensi 1} other {sentensi {v1, number}}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {sentensi 1} other {sentensi {v1, number}}}");
   P ("label.metrics.word_count_summary.no_words", "hakuna maneno");
   P ("label.metrics.sentence_count_summary.no_sentences", "hakuna sentensi");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "hakuna aya");
   P ("label.metrics.text_summary_with_options.no_words", "hakuna maneno");
   P ("label.metrics.text_summary_with_options.no_sentences", "hakuna sentensi");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "hakuna aya");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {neno 1} other {maneno {v1, number}}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {neno 1} other {maneno {v1, number}}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {URL tupu} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {URL tupu} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[mtumiaji amefichwa]");
   P ("label.endpoints.url_label.query", "hoja {count, plural, one {kigezo 1} other {vigezo {count, number}}}");
end Labels_4;
