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
				(if(Character'Pos(Str(J)) in 97..122) then
				    Character'Pos(res(J)) = Character'Pos(Str(J)) - 32
				else
				    Character'Pos(res(J)) = Character'Pos(Str(J))
				)
			       );
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

   
   function copia (vec1 : in Vector) return Vector is
      res : Vector (1..vec1'Length) := (others => 0);
      I : Positive := res'First;
   begin
      for J in vec1'Range loop
         
         res(I) := vec1(J);
         pragma Loop_Invariant(for all K in res'First..I =>
                                 (if I <= res'Last then 
                                     res(K)=vec1(vec1'First + K - res'First)
                                 else false)
                                );
         
      --   pragma Loop_Invariant(for all K in vec1'First..J =>
      --                           res(I)=vec1(K));
         
         pragma Loop_Variant(Increases => I);
         
         if I = Positive'Last  then
            return res;
         end if;
         I := I + 1;
         
      end loop;

      return res;
   end copia;


--     function concatenar (vec1 : in Vector; vec2 : in Vector) return Vector is 
--        res : Vector(1..vec1'Length+vec2'Length) := (others => 0);
--        I : Integer:=1;
--     begin
--        for J in vec1'Range loop
--           res(I) := vec1(J);
--           
--           pragma Loop_Invariant( 
--                                 for all K in res'First .. I =>
--                                   (if(vec1'First <= Integer'Last + (-K +1)) then 
--                                         res(K) = vec1(vec1'First + K - 1)
--                                   )
--                                 );
--           I := I +1;
--        end loop;
--              
--        for J in vec2'Range loop
--           res(I) := vec2(J);
--           
--           pragma Loop_Invariant( 
--                                 for all K in I'Loop_Entry .. I =>
--                                    (if(vec2'First <= Integer'Last + (-K +I'Loop_Entry)) then 
--                                         res(K) = vec2(vec2'First + K - I'Loop_Entry)
--                                   )
--                                 );
--           
--           I := I +1;
--        end loop;
--             
--        return res;
--     end concatenar;


end vectores;
