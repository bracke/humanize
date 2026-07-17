separate (Humanize.System_Status.Support)
procedure Signal_Info
  (Number   : Signal_Number;
   Mnemonic : out Unbounded_String;
   Reason   : out Unbounded_String)
is
begin
   case Number is
      when 1 =>
         Mnemonic := To_Unbounded_String ("SIGHUP");
         Reason := To_Unbounded_String ("hangup");
      when 2 =>
         Mnemonic := To_Unbounded_String ("SIGINT");
         Reason := To_Unbounded_String ("interrupt");
      when 3 =>
         Mnemonic := To_Unbounded_String ("SIGQUIT");
         Reason := To_Unbounded_String ("quit");
      when 4 =>
         Mnemonic := To_Unbounded_String ("SIGILL");
         Reason := To_Unbounded_String ("illegal instruction");
      when 5 =>
         Mnemonic := To_Unbounded_String ("SIGTRAP");
         Reason := To_Unbounded_String ("trace trap");
      when 6 =>
         Mnemonic := To_Unbounded_String ("SIGABRT");
         Reason := To_Unbounded_String ("abort");
      when 7 =>
         Mnemonic := To_Unbounded_String ("SIGBUS");
         Reason := To_Unbounded_String ("bus error");
      when 8 =>
         Mnemonic := To_Unbounded_String ("SIGFPE");
         Reason := To_Unbounded_String ("floating-point exception");
      when 9 =>
         Mnemonic := To_Unbounded_String ("SIGKILL");
         Reason := To_Unbounded_String ("killed");
      when 10 =>
         Mnemonic := To_Unbounded_String ("SIGUSR1");
         Reason := To_Unbounded_String ("user signal 1");
      when 11 =>
         Mnemonic := To_Unbounded_String ("SIGSEGV");
         Reason := To_Unbounded_String ("segmentation fault");
      when 12 =>
         Mnemonic := To_Unbounded_String ("SIGUSR2");
         Reason := To_Unbounded_String ("user signal 2");
      when 13 =>
         Mnemonic := To_Unbounded_String ("SIGPIPE");
         Reason := To_Unbounded_String ("broken pipe");
      when 14 =>
         Mnemonic := To_Unbounded_String ("SIGALRM");
         Reason := To_Unbounded_String ("alarm");
      when 15 =>
         Mnemonic := To_Unbounded_String ("SIGTERM");
         Reason := To_Unbounded_String ("termination request");
      when 17 =>
         Mnemonic := To_Unbounded_String ("SIGCHLD");
         Reason := To_Unbounded_String ("child status changed");
      when 18 =>
         Mnemonic := To_Unbounded_String ("SIGCONT");
         Reason := To_Unbounded_String ("continue");
      when 19 =>
         Mnemonic := To_Unbounded_String ("SIGSTOP");
         Reason := To_Unbounded_String ("stopped");
      when 20 =>
         Mnemonic := To_Unbounded_String ("SIGTSTP");
         Reason := To_Unbounded_String ("terminal stop");
      when 28 =>
         Mnemonic := To_Unbounded_String ("SIGWINCH");
         Reason := To_Unbounded_String ("window size changed");
      when others =>
         Mnemonic := To_Unbounded_String ("signal " & Image (Number));
         Reason := To_Unbounded_String ("unknown signal");
   end case;
end Signal_Info;
