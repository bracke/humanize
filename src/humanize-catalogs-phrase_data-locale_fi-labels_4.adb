separate (Humanize.Catalogs.Phrase_Data.Locale_Fi)
procedure Labels_4 is
begin
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {lukuaika 1 minuutti} other {lukuaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {puheaika 1 minuutti} other {puheaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {lukuaika 1 minuutti} other {lukuaika {v1, number} "
      & "minuuttia}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {lukuaika alle 1 minuutin} other {lukuaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {puheaika alle 1 minuutin} other {puheaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 kappale} other {{v1, number} kappaletta}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {lukuaika alle 1 minuutin} other {lukuaika alle {v1, "
      & "number} minuutin}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 virke} other {{v1, number} virkettä}}");
   P ("label.metrics.word_count_summary.no_words", "ei sanoja");
   P ("label.metrics.sentence_count_summary.no_sentences", "ei virkkeitä");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "ei kappaleita");
   P ("label.metrics.text_summary_with_options.no_words", "ei sanoja");
   P ("label.metrics.text_summary_with_options.no_sentences", "ei virkkeitä");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "ei kappaleita");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 sana} other {{v1, number} sanaa}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {tyhjä URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {tyhjä URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[piilotettu käyttäjä]");
   P ("label.endpoints.url_label.query",
      "kysely {count, plural, one {1 parametri} other {{count, number} "
      & "parametria}}");
end Labels_4;
