separate (Humanize.System_Status.Support)
function SQLSTATE_Reason (Class : SQLSTATE_Class) return String is
   Item : constant String := String (Class);
begin
   if Item = "00" then
      return "successful completion";
   elsif Item = "01" then
      return "warning";
   elsif Item = "02" then
      return "no data";
   elsif Item = "08" then
      return "connection exception";
   elsif Item = "0A" or else Item = "0a" then
      return "feature not supported";
   elsif Item = "22" then
      return "data exception";
   elsif Item = "23" then
      return "integrity constraint violation";
   elsif Item = "24" then
      return "invalid cursor state";
   elsif Item = "25" then
      return "invalid transaction state";
   elsif Item = "28" then
      return "invalid authorization specification";
   elsif Item = "2D" or else Item = "2d" then
      return "invalid transaction termination";
   elsif Item = "3D" or else Item = "3d" then
      return "invalid catalog name";
   elsif Item = "3F" or else Item = "3f" then
      return "invalid schema name";
   elsif Item = "40" then
      return "transaction rollback";
   elsif Item = "42" then
      return "syntax error or access rule violation";
   elsif Item = "53" then
      return "insufficient resources";
   elsif Item = "54" then
      return "program limit exceeded";
   elsif Item = "55" then
      return "object not in prerequisite state";
   elsif Item = "57" then
      return "operator intervention";
   elsif Item = "58" then
      return "system error";
   elsif Item = "HV" or else Item = "hv" then
      return "foreign data wrapper error";
   elsif Item = "P0" or else Item = "p0" then
      return "PL/pgSQL error";
   elsif Item = "XX" or else Item = "xx" then
      return "internal error";
   else
      return "unknown SQLSTATE class";
   end if;
end SQLSTATE_Reason;
