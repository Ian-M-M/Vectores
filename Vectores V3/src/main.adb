with vectores; use vectores;
with Text_IO;

procedure Main is
   vec : Vector := (1,2,3,4,5);
   vec1 : Vector (1 .. 5);
   vec2 : Vector (1 .. 10);
begin
   Text_IO.Put("Vec = ");
   for I in vec'Range loop
      Text_IO.Put(Integer'Image(vec(I)));
   end loop;
   Text_IO.Put_Line(" ");

   vec1 := vectores.copia(vec);

   Text_IO.Put("Vec1 = ");
   for I in vec1'Range loop
      Text_IO.Put(Integer'Image(vec1(I)));
   end loop;

   Text_IO.Put_Line(" ");

   vec2 := concatenar(vec,vec1);

    Text_IO.Put("Vec2 = ");
   for I in vec2'Range loop
      Text_IO.Put(Integer'Image(vec2(I)));
   end loop;

end Main;

