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
      for I in res'First .. res'Length loop
         pragma Loop_Invariant(vec1(I) < Integer'Last - vec2(I)); 
         res(I) := vec1(I) + vec2(I);
      end loop;
      
      return res;
   end suma;
   
--     function resta (vec1 : in Vector; vec2 : in Vector) return Vector is
--        res : Vector := vec1;
--     begin
--        for I in 1 .. vec1'Length loop
--           res(I) := vec1(I) - vec2(I);
--        end loop;
--        
--        return res;
--     end resta;
   
   
   
end vectores;
