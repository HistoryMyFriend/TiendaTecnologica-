drop database if exists tienda_tecnologia;
create database tienda_tecnologia;
use tienda_tecnologia;

drop table if exists articulos;
drop table if exists clientes;
drop table if exists facturas;
drop table if exists empleados;

create table clientes (
id int auto_increment,
nombre varchar(25) not null,
apellido varchar(25) not null,
cuit int(13) not null, 
direccion varchar(50)not null,
primary key (id)
);

 create table empleados(
 id int auto_increment,
 nombre varchar(25) not null,
 apellido varchar(25) not null,
 primary key (id)
 );

create table articulos(
id int auto_increment,
nombre varchar(50) not null,
precio double not null,
stock int not null,
producto enum('PC','CELULAR','TELEVISOR','TABLET','NETBOOK'),
primary key (id)
);

create table facturas(
id int auto_increment,
letra enum('A','B','C'),
fecha date,
monto double,
primary key (id),
idArticulo int,
idCliente int
);

alter table facturas
add constraint FK_facturas_idCliente
foreign key(id)
references clientes(id);

alter table facturas
add constraint FK_articulos_idArticulo
foreign key(id)
references articulos(id);

alter table clientes
add constraint FK_facturas_idFactura
foreign key(id)
references facturas(id);

alter table facturas
add constraint FK_empleados_idEmpleado
foreign key(id)
references empleados(id);


describe facturas;
describe articulos;
describe clientes;
describe empleados;


