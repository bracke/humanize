separate (Humanize.Catalogs.Phrase_Data.Locale_Pl)
procedure Labels_4 is
begin
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min czytania");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min mówienia");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min czytania");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "mniej niż {v1, number} min czytania");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "mniej niż {v1, number} min mówienia");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "mniej niż {v1, number} min czytania");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.word_count_summary.no_words", "brak słów");
   P ("label.metrics.sentence_count_summary.no_sentences", "brak zdań");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "brak akapitów");
   P ("label.metrics.text_summary_with_options.no_words", "brak słów");
   P ("label.metrics.text_summary_with_options.no_sentences", "brak zdań");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "brak akapitów");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
end Labels_4;
