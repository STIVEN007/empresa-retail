/*tabla canal*/
insert into canal(can_nombre,can_tipo)
values ('facebook','buscador');

select can_id_canal,can_nombre,can_tipo
from canal;

update canal
set can_nombre = 'instagram', can_tipo = 'red social'
where can_id_canal = 1;

delete from canal where can_id_canal = 1;





