
package vectores with SPARK_Mode => on is
   --Max : constant := 100;
   --subtype Index_Type  is Natural range 0 .. Max;
   type Vector is array(Integer range 1..3) of Integer;
   
   -- La funcion uppercase devuelve la String pasada por parámetro pero convertida
   --a uppercase.
   --function uppercase (Str : in String) return String;
   
   -- La funcion suma hace la suma de 2 vectores y devuelve el restultado en 
   --un nuevo vector.
   function suma (vec1 : in Vector; vec2 : in Vector) return Vector
   --Global
   --Depend
     with Pre => (if vec1'Length = vec2'Length and vec1'Length > 0 then True );
   
   -- La funcion resta hace la resta de 2 vectores y devuelve el restultado en 
   --un nuevo vector.
   --function resta (vec1 : in Vector; vec2 : in Vector) return Vector;
   
end vectores;
