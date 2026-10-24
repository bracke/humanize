separate (Humanize.Catalogs.Phrase_Data.Locale_Sv)
procedure Labels_4 is
begin
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minuts lästid} other {{v1, number} minuters "
      & "lästid}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minuts taltid} other {{v1, number} minuters "
      & "taltid}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minuts lästid} other {{v1, number} minuters "
      & "lästid}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {mindre än 1 minuts lästid} other {mindre än {v1, "
      & "number} minuters lästid}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {mindre än 1 minuts taltid} other {mindre än {v1, "
      & "number} minuters taltid}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {mindre än 1 minuts lästid} other {mindre än {v1, "
      & "number} minuters lästid}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.word_count_summary.no_words", "inga ord");
   P ("label.metrics.sentence_count_summary.no_sentences", "inga meningar");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "inga stycken");
   P ("label.metrics.text_summary_with_options.no_words", "inga ord");
   P ("label.metrics.text_summary_with_options.no_sentences", "inga meningar");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "inga stycken");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {tom URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {tom URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[dold användare]");
   P ("label.endpoints.url_label.query",
      "fråga {count, plural, one {1 parameter} other {{count, number} "
      & "parametrar}}");
end Labels_4;
