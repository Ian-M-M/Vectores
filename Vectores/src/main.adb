with vectores; use vectores;
with Ada.Text_IO; use Ada.Text_IO;
procedure main is
   x : String := "Prueba";
   V1 : Vector := (5,2,3);
   V2 : Vector := (5,2,3);
   V3 : Vector := suma(V1,V2);
begin   
   -- Put_Line(uppercase(x));
   
   for I in V1'First .. V1'Length loop
      Put(V3(I)'Img & " ");
   end loop;
   
   Put_Line("");
   --V3 := resta(V1,V2);
   
   for I in V1'First .. V1'Length loop
      Put(V3(I)'Img & " ");
   end loop;
   
end main;
