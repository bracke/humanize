with Check_Humanize_Policy_Support; use Check_Humanize_Policy_Support;

package body Check_Humanize_Policy_Non_Goals is
   procedure Check_Non_Goals
     (Root   : String;
      Errors : in out Natural)
   is
      Spec : constant String := Read_File (Root, "docs/specification.md");
   begin
      if not Contains (Spec, "## Non-Goals")
        or else not Contains (Spec, "time zone database")
        or else not Contains (Spec, "arbitrary CLDR import")
        or else not Contains (Spec, "full CLDR currency-formatting engines")
        or else not Contains
          (Spec, "application-defined runtime classifier plugins")
      then
         Error (Errors, "specification must keep Humanize non-goals explicit");
      end if;
   end Check_Non_Goals;
end Check_Humanize_Policy_Non_Goals;
