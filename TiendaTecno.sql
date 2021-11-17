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
idC int not null references clientes,
idE int not null references empleados,
idA int not null references articulos
);

alter table facturas
add constraint FK_facturas_idC_cliente
foreign key(idC)
references clientes(id);

alter table facturas
add constraint FK_facturas_idA_Articulo
foreign key(idA)
references articulos(id);

alter table facturas
add constraint FK_facturas_idE_Empleado
foreign key(idE)
references empleados(id);

alter table clientes
add constraint FK_clientes_idArticulo
foreign key(id)
references articulos(id);

describe facturas;
describe articulos;
describe clientes;
describe empleados;
