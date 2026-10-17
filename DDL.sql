create database veterinaria;

use veterinaria;

create table servicios (
    idServicio int primary key auto_increment,
    nombre varchar(50) not null,
    precio decimal(10,2) not null
);

create table clientes (
    idCliente int primary key auto_increment,
    nombre varchar(100) not null,
    direccion varchar(100) not null,
    correoElectronico varchar(100) not null,
    activo tinyint(1) not null
);

create table mascotas (
    idMascota int primary key auto_increment,
    nombre varchar(20) not null,
    nPatas int not null,
    estatura float not null,
    id_cliente int not null,
    foreign key id_cliente references idCliente on clientes
);

create table mascota_servicio (
    id_mascota int,
    id_servicio int,
    fecha date not null,
    primary key (id_mascota, id_servicio),
    foreign key (id_mascota) references mascotas(idMascota),
    foreign key (id_servicio) references servicios(idServicio)
);