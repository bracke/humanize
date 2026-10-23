separate (Humanize.Catalogs.Phrase_Data)
function Locale_Zh_Hant_Hk return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is
     (Entry_Line ("zh-Hant-HK", Name, Template));
begin
   return
     P ("due.today", "今日到期")
     & P ("due.tomorrow", "明日到期")
     & P ("recurrence.day", "{every, plural, =1 {每日} other {每{every}日}}")
     & P ("recurrence.week", "{every, plural, =1 {每星期} other {每{every}星期}}")
     & P ("file.uploading", "上載中");
end Locale_Zh_Hant_Hk;
