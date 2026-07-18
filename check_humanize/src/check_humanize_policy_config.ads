package Check_Humanize_Policy_Config is
   Required_GNAT_Native_Version : constant String := "15.2.1";
   Required_GNAT_Native_Pin     : constant String :=
     "gnat_native = ""=" & Required_GNAT_Native_Version & """";
   --  Alire pins the gnat_native crate at 15.2.1, while the GNAT executable
   --  distributed by that crate may report its upstream compiler patch level,
   --  for example GNATLS 15.2.0. Validate the executable family here and the
   --  exact Alire crate pin in the manifests.
   Expected_GNATLS_Prefix       : constant String := "GNATLS 15.2.";

   Humanize_Development_Manifest : constant String := "/alire.toml";
   Humanize_Release_Manifest     : constant String := "/alire.release.toml";
   Humanize_Build_Overlay        : constant String := "/alire.build.toml";
   Humanize_Tests_Manifest       : constant String := "/tests/alire.toml";
   Humanize_Tooling_Manifest     : constant String := "/check_humanize/alire.toml";

   Manifest_File      : constant String := "alire.toml";
   Release_File       : constant String := "alire.release.toml";
   Build_Overlay_File : constant String := "alire.build.toml";

   Required_I18N_Constraint : constant String := "i18n = "">=1.1.0""";
   Development_I18N_Pin     : constant String := "i18n = { path = ""../i18n"" }";
end Check_Humanize_Policy_Config;
