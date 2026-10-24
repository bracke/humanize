separate (Humanize.Catalogs.Phrase_Data.Locale_Sk)
procedure Labels_4 is
begin
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "menej ako {v1, number} min čítania");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "menej ako {v1, number} min hovorenia");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} odsek} few {{v1, number} odseky} many "
      & "{{v1, number} odseku} other {{v1, number} odsekov}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "menej ako {v1, number} min čítania");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} veta} few {{v1, number} vety} many "
      & "{{v1, number} vety} other {{v1, number} viet}}");
   P ("label.metrics.word_count_summary.no_words", "žiadne slová");
   P ("label.metrics.sentence_count_summary.no_sentences", "žiadne vety");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "žiadne odseky");
   P ("label.metrics.text_summary_with_options.no_words", "žiadne slová");
   P ("label.metrics.text_summary_with_options.no_sentences", "žiadne vety");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "žiadne odseky");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slová} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
end Labels_4;
