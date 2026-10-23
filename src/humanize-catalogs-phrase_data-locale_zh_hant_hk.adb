separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Zh_Hant_Hk (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "zh-Hant-HK", Name, Template);
   end P;
begin
   P ("due.today", "今日到期");
   P ("due.tomorrow", "明日到期");
   P ("recurrence.day", "{every, plural, =1 {每日} other {每{every}日}}");
   P ("recurrence.week", "{every, plural, =1 {每星期} other {每{every}星期}}");
   P ("file.uploading", "上載中");
   P ("system.component.online", "在線");
   P ("system.count.components", "{count, plural, =0 {沒有組件} other {{count}個組件}}");
   P ("system.component.unknown", "組件狀態不明");
   P ("system.http.client_error", "客戶端錯誤");
   P ("system.exit.invalid_argument", "結束代碼 {code}：無效的結束參數");
   P ("net_diagnostic.tcp", "{endpoint}：TCP連接失敗");
   P ("net_diagnostic.tls", "{endpoint}：TLS證書驗證失敗");
   P ("net_diagnostic.http", "{endpoint}：HTTP請求失敗");
   P ("net_diagnostic.proxy", "{endpoint}：代理伺服器連接失敗");
   P ("net_diagnostic.timeout", "{endpoint}：連接逾時");
   P ("net_diagnostic.reset", "{endpoint}：連接已重設");
   P ("net_diagnostic.unknown_network", "{endpoint}：網絡錯誤");
   P ("progress.state.running", "運行中");
   P ("calendar_date.fiscal_year", "{year}財政年度");
   P ("calendar_date.fiscal_quarter", "{year}財政年度第{part}季");
   P ("calendar_date.fiscal_half",
      "{part, plural, =1 {{year}財政年度上半年} other "
      & "{{year}財政年度下半年}}");
   P ("calendar_date.fiscal_year_end", "{year}財政年度末");
   P ("calendar_range.week.last", "上星期");
   P ("calendar_range.week.this", "本星期");
   P ("calendar_range.week.next", "下星期");
   P ("calendar_range.week_of", "{date}所在的星期");
   P ("http.reason.511", "需要網絡驗證");
   P ("errno.reason.6", "沒有此一裝置或地址");
   P ("errno.reason.98", "地址已在使用中");
   P ("signal.reason.10", "使用者定義信號 1");
   P ("signal.reason.12", "使用者定義信號 2");
   P ("system.signal_numbered", "信號 {number} {name} {reason}");
   P ("signal.reason.unknown", "未知信號");
   P ("file.kind.script", "腳本");
   P ("file.checksum", "{text}，檢查碼 {checksum}");
   P ("file.signature_match", "檔案簽名 {name}：{kind}，與副檔名相符");
   P ("file.signature_mismatch",
      "檔案簽名 "
      & "{name}：副檔名表示為{expected}，內容看似{actual}");
   P ("network_event.connecting", "連接中");
   P ("network_event.connected", "已連接");
   P ("network.session", "網絡 {endpoint}：{state}");
   P ("checksum.not_checked", "未檢查檢查碼");
   P ("checksum.valid", "檢查碼有效");
   P ("checksum.mismatch", "檢查碼不符");
   P ("checksum.missing", "缺少檢查碼");
end Locale_Zh_Hant_Hk;
