separate (Humanize.Catalogs.Phrase_Data)
function Locale_Es_419 return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("es-419", Name, Template));
begin
   return
     P ("field_added", "{field}: valor {value} agregado")
     & P ("api_key.api_key_expired", "clave de API vencida")
     & P ("auth.session_expired", "sesión expirada")
     & P ("billing.trialing", "período de prueba")
     & P ("payment.payment_expired", "pago vencido")
     & P ("security.token_expired", "token vencido")
     & P ("system.check.unknown", "estado de la verificación desconocido")
     & P ("system.incident.monitoring", "monitoreando")
     & P ("system.check_named", "verificación de {name}: {state}")
     & P ("system.count.checks",
          "{count, plural, =0 {ninguna verificación} one {{count} verificación} "
          & "many {{count} de verificaciones} other {{count} verificaciones}}")
     & P ("system.last_checked", "última verificación {time}")
     & P ("calendar_date.month_phase",
          "{phase, select, early {principios de {text}} mid {mediados de {text}} "
          & "other {fines de {text}}}")
     & P ("calendar_date.quarter_phase",
          "{phase, select, early {principios del {text}} mid {mediados del "
          & "{text}} other {fines del {text}}}");
end Locale_Es_419;
