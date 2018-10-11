package body vectores with SPARK_Mode => On is

--     function uppercase (Str : in String) return String is
--        ascii : Integer;
--        res : String := Str;
--     begin
--        for I in 1..Str'Length loop
--           --pasamos a decimal el caracter
--           ascii := Character'Pos(Str(I));
--           if ascii > 90 and ascii < 123 then
--              --pasamos el caracter (pasado a mayus) a decimal
--              res(I) := Character'Val(ascii - 32);
--           end if;
--        end loop;
--
--        return res;
--     end uppercase;

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
      for I in 1 .. vec1'Length loop
         res(I) := vec1(I) - vec2(I);
         pragma Loop_Invariant (for all K in res'First .. I =>
                                (res(K) = vec1(K) - vec2(K)));
      end loop;

      return res;
   end resta;

end vectores;
