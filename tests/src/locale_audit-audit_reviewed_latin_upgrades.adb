separate (Locale_Audit)
   procedure Audit_Reviewed_Latin_Upgrades
     (Locale : String;
      Texts  : Sample_Texts)
   is
      procedure Check
        (Label    : Sample_Label;
         Expected : String)
      is
      begin
         if To_String (Texts (Label)) /= Expected then
            Error
              (Locale, Label, To_String (Texts (Label)),
               "expected reviewed native locale wording");
         end if;
      end Check;
   begin
      if Locale = "da" then
         Check (Unit_Nautical_Mile, B ("352073C3B86D696C"));
      elsif Locale = "de" then
         Check (Unit_Foot, B ("35204675C39F"));
         Check (Unit_Teaspoon, B ("35205465656CC3B66666656C"));
         Check (Unit_Tablespoon, B ("35204573736CC3B66666656C"));
      elsif Locale = "fr" then
         Check
           (Unit_Celsius,
            B ("352064656772C3A9732043656C73697573"));
         Check
           (Unit_Square_Meter,
            B ("35206DC3A8747265732063617272C3A973"));
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35206B696C6F6DC3A87472657320706172206865757265"));
         Check
           (Unit_Teaspoon,
            B ("35206375696C6CC3A872657320C3A020636166C3A9"));
         Check
           (Unit_Fahrenheit,
            B ("352064656772C3A9732046616872656E68656974"));
         Check
           (Unit_Meter_Per_Second,
            B ("35206DC3A87472657320706172207365636F6E6465"));
         Check (Unit_Degree, B ("352064656772C3A973"));
         Check
           (Unit_Square_Kilometer,
            B ("35206B696C6F6DC3A8747265732063617272C3A973"));
         Check
           (Unit_Cubic_Meter,
            B ("35206DC3A874726573206375626573"));
         Check
           (Unit_Tablespoon,
            B ("35206375696C6CC3A872657320C3A020736F757065"));
      elsif Locale = "es" then
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35206B696CC3B36D6574726F7320706F7220686F7261"));
         Check (Unit_Hectare, B ("352068656374C3A172656173"));
         Check
           (Unit_Nautical_Mile,
            B ("35206D696C6C6173206EC3A1757469636173"));
         Check
           (Unit_Square_Kilometer,
            B ("35206B696CC3B36D6574726F7320637561647261646F73"));
         Check
           (Unit_Cubic_Meter,
            B ("35206D6574726F732063C3BA6269636F73"));
      elsif Locale = "pt" then
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35207175696CC3B46D6574726F7320706F7220686F7261"));
         Check
           (Unit_Teaspoon,
            B ("3520636F6C6865726573206465206368C3A1"));
         Check (Unit_Foot, B ("352070C3A973"));
         Check
           (Unit_Nautical_Mile,
            B ("35206D696C686173206EC3A1757469636173"));
         Check
           (Unit_Square_Kilometer,
            B ("35207175696CC3B46D6574726F7320717561647261646F73"));
         Check
           (Unit_Cubic_Meter,
            B ("35206D6574726F732063C3BA6269636F73"));
         Check (Unit_Cup, B ("352078C3AD6361726173"));
         Check (Unit_Gallon, B ("352067616CC3B56573"));
         Check (Unit_Ounce, B ("35206F6EC3A76173"));
      elsif Locale = "sv" then
         Check (Unit_Nautical_Mile, B ("3520736AC3B66D696C"));
      elsif Locale = "fi" then
         Check (Unit_Ton, B ("35206C7968797474C3A420746F6E6E6961"));
      elsif Locale = "pl" then
         Check
           (Unit_Kilometer_Per_Hour,
            B ("35206B696C6F6D65747279206E6120676F647A696EC499"));
         Check
           (Unit_Meter_Per_Second,
            B ("35206D65747279206E612073656B756E64C499"));
         Check
           (Unit_Cubic_Meter,
            B ("35206D6574727920737A65C59B6369656E6E65"));
         Check (Unit_Teaspoon, B ("3520C58279C5BC65637A6B69"));
         Check
           (Unit_Tablespoon,
            B ("3520C58279C5BC6B692073746FC5826F7765"));
         Check (Unit_Cup, B ("352066696C69C5BC616E6B69"));
         Check (Unit_Ton, B ("3520746F6E79206B72C3B3746B6965"));
      elsif Locale = "tr" then
         Check (Unit_Cubic_Meter, B ("35206D657472656BC3BC70"));
         Check (Unit_Ton, B ("35206BC4B1736120746F6E"));
      end if;
   end Audit_Reviewed_Latin_Upgrades;
