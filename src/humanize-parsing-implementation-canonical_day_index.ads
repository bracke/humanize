private package Humanize.Parsing.Implementation.Canonical_Day_Index is
   --  Reverse index for natural-day canonicalization. Each shipped locale's
   --  rendering of yesterday/today/tomorrow (against a fixed reference date)
   --  maps to its canonical English form. The index is built lazily on first
   --  use -- the same one-time work the old per-call loop did every time --
   --  so canonicalizing a day phrase is a single lookup rather than a
   --  re-render of every shipped locale on each call.

   --  @param Item  An already lower-cleaned candidate phrase.
   --  @param Found Set True when Item is a known localized day phrase.
   --  @return The canonical form when Found, otherwise Item unchanged.
   function Canonical (Item : String; Found : out Boolean) return String;
end Humanize.Parsing.Implementation.Canonical_Day_Index;
