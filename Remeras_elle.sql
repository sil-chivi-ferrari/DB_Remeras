create table TipoUsuario (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go


create table Usuarios (
Id bigint not null primary Key identity (1,1),
NombreUsuario varchar(100) not Null,
Contraseña varchar (15) not null,
IdTipoUsuario tinyint not null foreign key references TipoUsuario(Id)
)
go

create table DatosPersonales (
IdUsuario bigint not null primary Key,
Nombre varchar(100) not Null,
Apellido varchar(100) not Null,
DNI int not null,
FechaNac date not null,
Genero varchar (20) null,
Telefono int not null,
CP int not null,
Direccion varchar not null,
Ciudad varchar not null
)
go
alter table DatosPersonales
add constraint FK_DatosPersonales_IdUsuario foreign key (IdUsuario)references Usuarios (Id)
go

create table TipoPagos (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go

create table Estados (
Id tinyint not null primary Key identity (1,1),
NombreEstado varchar(20) not Null
)
go

create table Pedidos (
Id bigint not null primary Key identity (1,1),
IdUsuario bigint not null,
IdEstado tinyint not null  
)
go


alter table Pedidos
add constraint FK_Pedidos_Estado foreign key (IdEstado)  references Estados (Id)
GO

alter table Pedidos
add constraint FK_Pedidos_Usuarios foreign key (IdUsuario) references  Usuarios (Id)
go


create table Factura (
Id bigint not null primary Key identity (1,1),
IdPedido bigint not null foreign key references Pedidos (Id),
PrecioActual money not  null,
CantidadPedida tinyint not null,
)
go

create table TipoProducto (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go

create table Producto (
Id bigint not null primary Key identity (1,1),
IdTipo tinyint not null foreign key references TipoProducto (Id),
Precio money not  null,
Nombre varchar(50) not Null,
Talle Varchar(20) not null,
Descripcion varchar (100)
)
go

create table ProductoxFactura (
IdFactura bigint not null foreign key references Factura (Id),
IdProducto bigint not null foreign key references Producto (Id),
primary key (IdFactura, IdProducto)
)
go

create table Stock (
IdProducto bigint not null primary Key,
StockActual smallint not  null,
StockMinimo smallint not Null
)
go

alter table Stock
add constraint FK_Stock_IdProducto foreign key (IdProducto) references Producto (Id)
go

create table TipoPagos (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go

create table Pagos (
IdPedido bigint not null primary Key,
IdTipoPago tinyint not null,
Monto money not  null
)
go

alter table Pagos
add constraint FK_Pagos_IdProducto foreign key (IdPedido) references Producto (Id)
go

alter table Pagos
add constraint FK_Pagos_TipoPagos foreign key (IdTipoPago)  references TipoPagos (Id)
go














