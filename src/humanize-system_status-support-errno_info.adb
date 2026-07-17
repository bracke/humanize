separate (Humanize.System_Status.Support)
procedure Errno_Info
  (Code     : Errno_Code;
   Mnemonic : out Unbounded_String;
   Reason   : out Unbounded_String)
is
begin
   case Code is
      when 0 =>
         Mnemonic := To_Unbounded_String ("OK");
         Reason := To_Unbounded_String ("success");
      when 1 =>
         Mnemonic := To_Unbounded_String ("EPERM");
         Reason := To_Unbounded_String ("operation not permitted");
      when 2 =>
         Mnemonic := To_Unbounded_String ("ENOENT");
         Reason := To_Unbounded_String ("no such file or directory");
      when 3 =>
         Mnemonic := To_Unbounded_String ("ESRCH");
         Reason := To_Unbounded_String ("no such process");
      when 4 =>
         Mnemonic := To_Unbounded_String ("EINTR");
         Reason := To_Unbounded_String ("interrupted system call");
      when 5 =>
         Mnemonic := To_Unbounded_String ("EIO");
         Reason := To_Unbounded_String ("input/output error");
      when 6 =>
         Mnemonic := To_Unbounded_String ("ENXIO");
         Reason := To_Unbounded_String ("no such device or address");
      when 9 =>
         Mnemonic := To_Unbounded_String ("EBADF");
         Reason := To_Unbounded_String ("bad file descriptor");
      when 11 =>
         Mnemonic := To_Unbounded_String ("EAGAIN");
         Reason := To_Unbounded_String ("resource temporarily unavailable");
      when 12 =>
         Mnemonic := To_Unbounded_String ("ENOMEM");
         Reason := To_Unbounded_String ("not enough memory");
      when 13 =>
         Mnemonic := To_Unbounded_String ("EACCES");
         Reason := To_Unbounded_String ("permission denied");
      when 17 =>
         Mnemonic := To_Unbounded_String ("EEXIST");
         Reason := To_Unbounded_String ("file exists");
      when 20 =>
         Mnemonic := To_Unbounded_String ("ENOTDIR");
         Reason := To_Unbounded_String ("not a directory");
      when 21 =>
         Mnemonic := To_Unbounded_String ("EISDIR");
         Reason := To_Unbounded_String ("is a directory");
      when 22 =>
         Mnemonic := To_Unbounded_String ("EINVAL");
         Reason := To_Unbounded_String ("invalid argument");
      when 24 =>
         Mnemonic := To_Unbounded_String ("EMFILE");
         Reason := To_Unbounded_String ("too many open files");
      when 28 =>
         Mnemonic := To_Unbounded_String ("ENOSPC");
         Reason := To_Unbounded_String ("no space left on device");
      when 32 =>
         Mnemonic := To_Unbounded_String ("EPIPE");
         Reason := To_Unbounded_String ("broken pipe");
      when 98 =>
         Mnemonic := To_Unbounded_String ("EADDRINUSE");
         Reason := To_Unbounded_String ("address already in use");
      when 110 =>
         Mnemonic := To_Unbounded_String ("ETIMEDOUT");
         Reason := To_Unbounded_String ("connection timed out");
      when 111 =>
         Mnemonic := To_Unbounded_String ("ECONNREFUSED");
         Reason := To_Unbounded_String ("connection refused");
      when others =>
         Mnemonic := To_Unbounded_String ("errno " & Image (Code));
         Reason := To_Unbounded_String ("unknown error");
   end case;
end Errno_Info;
