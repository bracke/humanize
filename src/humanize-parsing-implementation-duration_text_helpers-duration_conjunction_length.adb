separate (Humanize.Parsing.Implementation.Duration_Text_Helpers)
function Duration_Conjunction_Length
     (Text  : String;
      Index : Natural)
      return Natural
   is
      Low : constant String := Lower (Text);
begin
      if Starts_At (Low, Index, "and ") then
         return 4;
      elsif Starts_At (Low, Index, "und ") then
         return 4;
      elsif Starts_At (Low, Index, "och ") then
         return 4;
      elsif Starts_At (Low, Index, "og ") then
         return 3;
      elsif Starts_At (Low, Index, "et ") then
         return 3;
      elsif Starts_At (Low, Index, "en ") then
         return 3;
      elsif Starts_At (Low, Index, "of ") then
         return 3;
      elsif Starts_At (Low, Index, "ja ") then
         return 3;
      elsif Starts_At (Low, Index, "ve ") then
         return 3;
      elsif Starts_At (Low, Index, "na ") then
         return 3;
      elsif Starts_At (Low, Index, "y ") then
         return 2;
      elsif Starts_At (Low, Index, "i ") then
         return 2;
      elsif Starts_At (Low, Index, "ir ") then
         return 3;
      elsif Starts_At (Low, Index, "in ") then
         return 3;
      elsif Starts_At (Low, Index, "va ") then
         return 3;
      elsif Starts_At (Low, Index, "dan ") then
         return 4;
      elsif Starts_At (Low, Index, "kaj ") then
         return 4;
      elsif Starts_At (Low, Index, "e ") then
         return 2;
      elsif Starts_At (Low, Index, "es ") then
         return 3;
      elsif Starts_At (Low, Index, "a ") then
         return 2;
      elsif Starts_At (Low, Index, B ("C8996920")) then
         return 3;
      elsif Starts_At (Low, Index, B ("D0B820")) then
         return 3;
      elsif Starts_At (Low, Index, B ("D19620")) then
         return 3;
      elsif Starts_At (Low, Index, B ("E381A820")) then
         return 4;
      elsif Starts_At (Low, Index, B ("EBA78F20")) then
         return 4;
      elsif Starts_At (Low, Index, B ("EBB08F20")) then
         return 4;
      elsif Starts_At (Low, Index, B ("E5928C20")) then
         return 4;
      elsif Starts_At (Low, Index, B ("D98820")) then
         return 3;
      elsif Starts_At (Low, Index, B ("E0A494E0A4B020")) then
         return 7;
      else
         return 0;
      end if;
end Duration_Conjunction_Length;
