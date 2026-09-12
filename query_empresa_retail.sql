/*tabla canal*/
insert into canal(can_nombre, can_tipo)
values ('facebook','red social'),
('instagram','red social'),
('tik tok','red social'),
('telegram','buscador'),
('youtube','buscador');

select can_id_canal,can_nombre,can_tipo
from canal;

update canal
set can_nombre = 'instagram', can_tipo = 'red social'
where can_id_canal = 1;

delete from canal where can_id_canal = 1;

/* tabla cliente */

insert into cliente(cli_nombre, cli_apellido, cli_correo, cli_telefono, cli_ciudad, cli_fecha_registro)
values ('peter','fernandez','peter@gmail.com','3218278589','popayan','2026-09-12'),
('stiven','llanten','stiven@gmail.com','3318278589','cali','2026-09-12'),
('kevin','coca','kevin@gmail.com','3258278589','medellin','2026-09-12'),
('juan','botina','juan@gmail.com','3358278589','choco','2026-09-12'),
('matias','isai','matias@gmail.com','3561827858','pereira','2026-09-12');
 
select cli_id_cliente, cli_nombre, cli_correo, cli_ciudad
from cliente;
 

/*tabla campania */

 insert into campania(cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final, canal_can_id_canal)
values
('verano2026', 5000000, '2026-06-01', '2026-06-30',
  (select can_id_canal from canal where can_nombre = 'facebook')),
('blackfriday', 8000000, '2026-11-01', '2026-11-30',
  (select can_id_canal from canal where can_nombre = 'instagram')),
('lanzamiento', 3000000, '2026-03-01', '2026-03-15',
  (select can_id_canal from canal where can_nombre = 'tik tok')),
('navidad2026', 10000000, '2026-12-01', '2026-12-24',
  (select can_id_canal from canal where can_nombre = 'telegram')),
('aniversario', 4500000, '2026-07-10', '2026-07-20',
  (select can_id_canal from canal where can_nombre = 'youtube'));
 
select cam_id_campania, cam_nombre, canal_can_id_canal
from campania;

/*conversion*/

insert into conversion(con_tipo, con_valor, con_fecha, cliente_cli_id_cliente)
values
('compra', 150000, '2026-06-05',
  (select cli_id_cliente from cliente where cli_correo = 'peter@gmail.com')),
('registro', 0, '2026-06-10',
  (select cli_id_cliente from cliente where cli_correo = 'stiven@gmail.com')),
('suscripcion', 25000, '2026-06-15',
  (select cli_id_cliente from cliente where cli_correo = 'kevin@gmail.com')),
('compra', 320000, '2026-11-05',
  (select cli_id_cliente from cliente where cli_correo = 'juan@gmail.com')),
('compra', 0, '2026-11-20',
  (select cli_id_cliente from cliente where cli_correo = 'matias@gmail.com'));
 
select con_id_conversion, con_tipo, con_valor, cliente_cli_id_cliente
from conversion;


/*conversion*/


insert into interaccion(int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente)
values
('clic', '2026-06-02',
  (select cam_id_campania from campania where cam_nombre = 'verano2026'),
  (select cli_id_cliente from cliente where cli_correo = 'peter@gmail.com')),
('visita', '2026-06-03',
  (select cam_id_campania from campania where cam_nombre = 'verano2026'),
  (select cli_id_cliente from cliente where cli_correo = 'stiven@gmail.com')),
('clic', '2026-11-03',
  (select cam_id_campania from campania where cam_nombre = 'blackfriday'),
  (select cli_id_cliente from cliente where cli_correo = 'kevin@gmail.com')),
('comentario', '2026-03-05',
  (select cam_id_campania from campania where cam_nombre = 'lanzamiento'),
  (select cli_id_cliente from cliente where cli_correo = 'juan@gmail.com')),
('descarga', '2026-12-05',
  (select cam_id_campania from campania where cam_nombre = 'navidad2026'),
  (select cli_id_cliente from cliente where cli_correo = 'matias@gmail.com'));

select int_id_interaccion, int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente
from interaccion;
