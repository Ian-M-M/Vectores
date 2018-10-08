
package vectores with SPARK_Mode => on is
   
   type Vector is array(Positive range 1 .. 10) of Integer;

   -- La funcion uppercase devuelve la String pasada por parametro pero convertida
   --a uppercase.
   --function uppercase (Str : in String) return String;

   -- La funcion suma hace la suma de 2 vectores y devuelve el restultado en
   --un nuevo vector.
   function suma (vec1 : in Vector; vec2 : in Vector) return Vector
   --Global
   --Depend
     with 
       Pre => vec1'First = vec2'First 
       and vec1'Last = vec2'Last 
       and vec1'Length > 0 
       and (for all I in vec1'Range =>              
              (if vec1(I) > 0 and vec2(I) > 0 then
                   vec1(I)  <= Integer'Last - vec2(I))                
            and (if vec1(I) < 0 and vec2(I) < 0 then                   
                   vec1(I) >= Integer'First - vec2(I))),
     
       Post => (for all I in vec1'Range => 
                  suma'Result (I) = vec1(I)+vec2(I));
       
   -- La funcion resta hace la resta de 2 vectores y devuelve el restultado en
   --un nuevo vector.
   --function resta (vec1 : in Vector; vec2 : in Vector) return Vector;

end vectores;
