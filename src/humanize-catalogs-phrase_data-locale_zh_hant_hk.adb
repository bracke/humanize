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
     & P ("file.uploading", "上載中")
     & P ("system.component.online", "在線")
     & P ("system.count.components", "{count, plural, =0 {沒有組件} other {{count}個組件}}")
     & P ("system.component.unknown", "組件狀態不明")
     & P ("system.http.client_error", "客戶端錯誤")
     & P ("system.exit.invalid_argument", "結束代碼 {code}：無效的結束參數")
     & P ("net_diagnostic.tcp", "{endpoint}：TCP連接失敗")
     & P ("net_diagnostic.tls", "{endpoint}：TLS證書驗證失敗")
     & P ("net_diagnostic.http", "{endpoint}：HTTP請求失敗")
     & P ("net_diagnostic.proxy", "{endpoint}：代理伺服器連接失敗")
     & P ("net_diagnostic.timeout", "{endpoint}：連接逾時")
     & P ("net_diagnostic.reset", "{endpoint}：連接已重設")
     & P ("net_diagnostic.unknown_network", "{endpoint}：網絡錯誤")
     & P ("progress.state.running", "運行中");
end Locale_Zh_Hant_Hk;
