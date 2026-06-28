--  Root namespace for the Humanize Ada 2022 library.
--
--  Humanize classifies machine values (relative datetimes, durations, byte
--  sizes) into semantic localization keys and renders them through the public
--  I18N runtime. Humanize does not own locale fallback, message parsing, plural
--  rules, or catalog rendering -- those belong to i18n.
package Humanize is
   pragma Preelaborate;
end Humanize;
