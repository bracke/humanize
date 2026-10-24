separate (Humanize.Catalogs.Phrase_Data.Locale_De)
procedure Labels_4 is
begin
   P ("label.palettes.palette_summary.mostly_lime", "überwiegend Limettengrün");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochrome Palette");
   P ("label.palettes.palette_summary.mostly_black", "überwiegend Schwarz");
   P ("label.palettes.palette_summary.mostly_yellow", "überwiegend Gelb");
   P ("label.palettes.palette_summary.mostly_maroon", "überwiegend Kastanienbraun");
   P ("label.palettes.palette_summary.mostly_white", "überwiegend Weiß");
   P ("label.palettes.palette_summary.mostly_orange", "überwiegend Orange");
   P ("label.palettes.palette_summary.mostly_fuchsia", "überwiegend Fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutrale Palette");
   P ("label.palettes.palette_summary.mostly_red", "überwiegend Rot");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 Minute Lesezeit} other {{v1, number} Minuten "
      & "Lesezeit}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 Minute Sprechzeit} other {{v1, number} Minuten "
      & "Sprechzeit}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 Minute Lesezeit} other {{v1, number} Minuten "
      & "Lesezeit}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {weniger als 1 Minute Lesezeit} other {weniger als "
      & "{v1, number} Minuten Lesezeit}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {weniger als 1 Minute Sprechzeit} other {weniger als "
      & "{v1, number} Minuten Sprechzeit}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {weniger als 1 Minute Lesezeit} other {weniger als "
      & "{v1, number} Minuten Lesezeit}}");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.word_count_summary.no_words", "keine Wörter");
   P ("label.metrics.sentence_count_summary.no_sentences", "keine Sätze");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "keine Absätze");
   P ("label.metrics.text_summary_with_options.no_words", "keine Wörter");
   P ("label.metrics.text_summary_with_options.no_sentences", "keine Sätze");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "keine Absätze");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {leere URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {leere URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[geschwärzter Benutzer]");
   P ("label.endpoints.url_label.query",
      "Abfrage {count, plural, one {1 Parameter} other {{count, number} "
      & "Parameter}}");
end Labels_4;
