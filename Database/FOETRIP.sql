create database  if not exists FoeTrip;
use FoeTrip;

Create table if not exists Alumno(
idAlumno int not null auto_increment,
MatriculaAlumno int(11) not null unique,
Nombre varchar(25) not null,
Apaterno varchar(30) not null,
Amaterno varchar(30) not null,
licencia int(15) unique,
idUsuario int,
foreign key (idUsuario) references Usuario(idUsuario),
primary key (idAlumno)


);

Create table if not exists Docente(
idDocente int not null auto_increment,
MatriculaDocente int(11) not null unique,
Nombre varchar(25) not null,
Apaterno varchar(30) not null,
Amaterno varchar(30) not null,
licencia int(15) unique,
idUsuario int,
foreign key (idUsuario) references Usuario(idUsuario),
primary key (idDocente)
);

create Table if not exists Vehiculo(
idVehiculo int not null auto_increment,
Marca varchar(45) not null,
Modelo varchar(45) not null,
Color varchar(45) not null,
Placas varchar(45) not null unique,
capacidad int,
MarcaSeguro varchar(45) not null,
poliSeguro varchar(50) not null unique,
idDocente int,
licencia int(15),
idAlumno int,
foreign key(idDocente) references Docente(idDocente),
foreign key(licencia) references Docente(licencia),
foreign key(idAlumno) references Alumno(idAlumno),
foreign key(licencia) references Alumno(licencia),
primary key(idVehiculo)
);


create table if not exists Usuario(
idUsuario int not null auto_increment primary key unique,
Usuario varchar(18) not null,
contrasegna varchar(18) not null,
correo varchar(50) not null

);

-- analisando la implementacion de esta tabla--
create table if not exists viaje(
idViaje int not null auto_increment unique,
Destino varchar (250) not null,
fecha date not null,
horaIncio time not null,
horaTermino time not null,
idDocente int,
idAlumno int,
idVehiculo int,
foreign key(idDocente) references Docente (idDocente),
foreign key(idAlumno) references Alumno(idAlumno),
foreign key (idVehiculo) references Vehiculo(idVehiculo),
primary key (idViaje)
);


/* tabla sin contenido ayuda para completarla 
 create table if not exists chofer(

);
 */



