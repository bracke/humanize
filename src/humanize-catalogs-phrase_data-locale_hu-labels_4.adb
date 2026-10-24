separate (Humanize.Catalogs.Phrase_Data.Locale_Hu)
procedure Labels_4 is
begin
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "kevesebb mint {v1, number} perc beszéd");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} bekezdés");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "kevesebb mint {v1, number} perc olvasás");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} mondat");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} mondat");
   P ("label.metrics.word_count_summary.no_words", "nincs szó");
   P ("label.metrics.sentence_count_summary.no_sentences", "nincs mondat");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "nincs bekezdés");
   P ("label.metrics.text_summary_with_options.no_words", "nincs szó");
   P ("label.metrics.text_summary_with_options.no_sentences", "nincs mondat");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "nincs bekezdés");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} szó");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} szó");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {üres URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {üres URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[rejtett felhasználó]");
   P ("label.endpoints.url_label.query",
      "lekérdezés {count, plural, one {1 paraméter} other {{count, number} "
      & "paraméter}}");
end Labels_4;
