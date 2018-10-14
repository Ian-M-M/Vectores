
package vectores with SPARK_Mode => on is
   Max : constant := 1000;
   type Vector is array(Positive range <>) of Integer;
   
   

   -- La funcion uppercase devuelve la String pasada por parametro pero convertida
   --a uppercase.
   function uppercase (Str : in String) return String
     with 
     Pre => Str'Length > 0,
     
       Post =>(for all I in Str'Range =>
              Character'Pos((uppercase'Result(I))) not in 97..122 );
   

   -- La funcion suma hace la suma de 2 vectores y devuelve el restultado en
   --un nuevo vector.
   function suma (vec1 : in Vector; vec2 : in Vector) return Vector
   --Global
   --Depend
     with 
       Pre => vec1'First = vec2'First 
       and then vec1'Last = vec2'Last 
       and then vec1'Length > 0
       and then (for all I in vec1'Range =>              
                        (if vec1(I) > 0 and vec2(I) > 0 then
							vec1(I)  <= Integer'Last - vec2(I)
                        elsif vec1(I) < 0 and vec2(I) < 0 then            
							vec1(I) >= Integer'First - vec2(I)
                     )
                 ),
     
       Post => (for all I in vec1'Range => 
                  suma'Result (I) = vec1(I)+vec2(I));
       
   -- La funcion resta hace la resta de 2 vectores y devuelve el restultado en
   --un nuevo vector.
   function resta (vec1 : in Vector; vec2 : in Vector) return Vector
     with 
       
       Pre => vec1'First = vec2'First 
       and then vec1'Last = vec2'Last 
       and then vec1'Length > 0
       and then(for all I in vec1'Range =>
                       (if vec2(I) = Integer'First then False
                        elsif vec1(I) > 0 and vec2(I) < 0 then
                             vec1(I) <= Integer'Last + vec2(I) 
                        elsif vec1(I) < 0 and vec2(I) > 0 then            
                             vec1(I)  >= Integer'First + vec2(I)
                       )
               ),
     
       Post => (for all I in vec1'Range => 
                  resta'Result (I) = vec1(I)-vec2(I));
   
   -- La funcion copia hace la copia de un vector y devuelvo el 
   -- resultado en un
   -- nuevo vector.  
   function copia (vec1 : in Vector) return Vector;
   -- La funcion concatenar añade a un nuevo vector el primer vector 
   -- más el
   -- contenido del segundo y lo devuelve.
   function concatenar (vec1 : in Vector; vec2 : in Vector) return 
Vector;
   
   
end vectores;
