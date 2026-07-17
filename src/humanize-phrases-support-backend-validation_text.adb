separate (Humanize.Phrases.Support.Backend)
function Validation_Text
     (Locale : String;
      Status : Validation_Status)
      return String
   is
begin
      if Has_Generated_Phrase_Pack (Locale) then
         return Generated_Phrase (Locale, Validation_Status'Image (Status));
      elsif Locale = "de" then
         case Status is
            when Required => return "erforderlich";
            when Optional => return "optional";
            when Invalid => return "ungultig";
            when Too_Short => return "zu kurz";
            when Too_Long => return "zu lang";
            when Out_Of_Range => return "ausserhalb des Bereichs";
            when Already_Exists => return "existiert bereits";
         end case;
      else
         case Status is
            when Required => return "required";
            when Optional => return "optional";
            when Invalid => return "invalid";
            when Too_Short => return "too short";
            when Too_Long => return "too long";
            when Out_Of_Range => return "out of range";
            when Already_Exists => return "already exists";
         end case;
      end if;
end Validation_Text;
