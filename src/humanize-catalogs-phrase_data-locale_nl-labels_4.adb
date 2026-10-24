separate (Humanize.Catalogs.Phrase_Data.Locale_Nl)
procedure Labels_4 is
begin
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minuut leestijd} other {{v1, number} minuten "
      & "leestijd}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 alinea} other {{v1, number} alinea’s}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {minder dan 1 minuut leestijd} other {minder dan {v1, "
      & "number} minuten leestijd}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {minder dan 1 minuut spreektijd} other {minder dan "
      & "{v1, number} minuten spreektijd}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 alinea} other {{v1, number} alinea’s}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {minder dan 1 minuut leestijd} other {minder dan {v1, "
      & "number} minuten leestijd}}");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, plural, one {1 zin} other {{v1, number} zinnen}}");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, plural, one {1 zin} other {{v1, number} zinnen}}");
   P ("label.metrics.word_count_summary.no_words", "geen woorden");
   P ("label.metrics.sentence_count_summary.no_sentences", "geen zinnen");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "geen alinea’s");
   P ("label.metrics.text_summary_with_options.no_words", "geen woorden");
   P ("label.metrics.text_summary_with_options.no_sentences", "geen zinnen");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "geen alinea’s");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 woord} other {{v1, number} woorden}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 woord} other {{v1, number} woorden}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {lege URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {lege URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[afgeschermde gebruiker]");
   P ("label.endpoints.url_label.query",
      "query {count, plural, one {1 parameter} other {{count, number} "
      & "parameters}}");
end Labels_4;
