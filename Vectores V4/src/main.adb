with vectores; use vectores;
with Text_IO; use Text_IO;

procedure Main is
   vec : Vector := (1,2,3,4,5);
   vec1 : Vector(1 .. 0);
   vec2 : Vector(1..2):=(1,2);
   res : Vector:= copia(vec1);
begin
   Put_Line("length: " & res'Length'Img);
   for I in res'Range loop
      Put(res(I)'Img & " ");
   end loop;


end Main;

