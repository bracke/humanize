package body Humanize.Catalog_Loads is

   protected Counter is
      procedure Increment;
      function Value return Natural;
   private
      Loads : Natural := 0;
   end Counter;

   protected body Counter is
      procedure Increment is
      begin
         Loads := (if Loads = Natural'Last then 0 else Loads + 1);
      end Increment;

      function Value return Natural is (Loads);
   end Counter;

   procedure Note_Load is
   begin
      Counter.Increment;
   end Note_Load;

   function Count return Natural is (Counter.Value);

end Humanize.Catalog_Loads;
