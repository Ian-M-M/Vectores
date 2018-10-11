package body vectores with SPARK_Mode => On is

   function uppercase (Str : in String) return String is
      ascii : Integer;
      res : String := Str;
   begin
      for I in Str'Range loop
         ascii := Character'Pos(Str(I));
         if ascii >= 97 and ascii <= 122 then
            res(I) := Character'Val(ascii - 32);
         end if;
         pragma Loop_Invariant(for all J in Str'First..I =>
                              Character'Pos((res(J))) not in 97..122);
      end loop;

      return res;
   end uppercase;

   function suma (vec1 : in Vector; vec2 : in Vector) return Vector is
      res : Vector := vec1;
   begin
      for I in vec1'Range loop
         res(I) := vec1(I) + vec2(I);
         pragma Loop_Invariant (for all K in res'First .. I =>
                                (res(K) = vec1(K) + vec2(K)));
      end loop;

      return res;
   end suma;

   function resta (vec1 : in Vector; vec2 : in Vector) return Vector is
      res : Vector := vec1;
   begin
      for I in vec1'Range loop
         res(I) := vec1(I) - vec2(I);
         pragma Loop_Invariant (for all K in res'First .. I =>
                                (res(K) = vec1(K) - vec2(K)));
      end loop;

      return res;
   end resta;

end vectores;
