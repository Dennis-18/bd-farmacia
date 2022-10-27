--CREAR TABLA DE TIPOS DE USUARIO, PARA NIVELES DE PERMISOS
create table tipos_usuario
(
id_tipo_usuario SERIAL,
descripcion varchar(100),
estado int
);

--TABLA QUE ALMACENA LOS USUARIOS
create table usuarios
(
id_usuario serial,
nombre varchar(50),
apellido varchar(50),
fecha_nacimiento date,
dpi varchar(50),
renglon varchar(10),
telefono varchar(25),
correo varchar(50),
id_tipo_usuario int,
fecha_registro date,
password varchar(50),
estado int
);


--TABLA DE PRODUCTOS
create table productos
(
id_producto serial,
descripcion varchar(200),
precio_unitario numeric,
fecha_registro date
);


--TABLA DE SERVICIOS
create table servicios
(
id_servicio serial,
descripcion varchar (200),
fecha_registro date,
estado int
);


--TABLA DE INVENTARIO
create table inventario
(
id_inventario serial,
id_producto int,
cantidad_anterior int,
cantidad_actual int,
fecha_nuevo_registro timestamp,
ultimo_movimiento int,
tipo_ultimo_movimiento int
);

--TABLA DE INGRESOS DE INVENTARIO
create table ingresos_inventario
(
id_ingreso serial,
id_producto int,
cantidad int,
fecha_registro timestamp,
usuario int
);

--TABLA DE DESPACHOS DE INVENTARIO
create table despachos_inventario
(
id_despacho serial,
id_producto int,
cantidad int,
fecha_registro timestamp,
usuario int
);

--TABLA DE TIPOS DE MOVIMEINTO DE INVENTARIO
create table tipo_movimiento
(
id_tipo_movimiento serial,
descripcion varchar(200),
estado int
);

--DATOS DE TIPOS DE MOVIMIENTO DE INVENTARIO
insert into tipo_movimiento (descripcion, estado) values('Ingreso', 1);
insert into tipo_movimiento (descripcion, estado) values('Despacho', 1);


--ALTERACIONES A LA TABLA DE DESPACHOS INVENTARIO
alter table despachos_inventario add column id_servicio int;
alter table despachos_inventario add column unidad_medida varchar(100);
alter table despachos_inventario add column no_referencia varchar(100);

--ALTERACIONES A LA TABLA DE PRODUCTOS
alter table productos add column precio_unitario numeric;
alter table productos add column estado int;
alter table productos add column stock_minimo int;


--TABLA DE AJUSTES DE INVENTARIO
create table ajustes_inventario
(
id_ajuste serial,
id_producto int,
lote varchar(100),
fecha_movimiento timestamp,
cantidad_ajuste int,
tipo_ajuste int,
descripcion varchar(100),
usuario int
);