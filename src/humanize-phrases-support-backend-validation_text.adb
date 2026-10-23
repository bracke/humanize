separate (Humanize.Phrases.Support.Backend)
function Validation_Text (Status : Validation_Status) return String is
begin
   case Status is
      when Required => return "required";
      when Optional => return "optional";
      when Invalid => return "invalid";
      when Too_Short => return "too short";
      when Too_Long => return "too long";
      when Out_Of_Range => return "out of range";
      when Already_Exists => return "already exists";
   end case;
end Validation_Text;
