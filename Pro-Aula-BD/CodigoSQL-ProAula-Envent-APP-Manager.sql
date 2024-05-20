-- CREAR LA BASE DE DATOS #DUVAN MESA
CREATE DATABASE IF NOT EXISTS appeventmanager;

USE appeventmanager;

-- Crear tabla Roles
CREATE TABLE Roles (
    RolID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50)
);

-- Crear tabla Permisos
CREATE TABLE Permisos (
    PermisoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50)
);

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    PrimerNombre VARCHAR(255),
    SegundoNombre VARCHAR(255),
    PrimerApellido VARCHAR(255),
    SegundoApellido VARCHAR(255),
    Correo VARCHAR(255),
    Contraseña VARCHAR(255),
    Calle VARCHAR(255),
    Ciudad VARCHAR(100),
    Estado VARCHAR(100),
    CodigoPostal VARCHAR(10),
    RolID INT
);

-- Crear tabla EmpresasOrganizadoras
CREATE TABLE EmpresasOrganizadoras (
    EmpresaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Correo VARCHAR(255),
    Calle VARCHAR(255),
    Ciudad VARCHAR(100),
    Estado VARCHAR(100),
    CodigoPostal VARCHAR(10),
    Descripcion TEXT
);

-- Crear tabla Lugares
CREATE TABLE Lugares (
    LugarID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Calle VARCHAR(255),
    Ciudad VARCHAR(100),
    Estado VARCHAR(100),
    CodigoPostal VARCHAR(10),
    Tipo VARCHAR(50),
    Capacidad INT,
    Descripcion TEXT
);

-- Crear tabla Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Correo VARCHAR(255),
    Tipo VARCHAR(50),
    Descripcion TEXT
);

-- Crear tabla TelefonosUsuario
CREATE TABLE TelefonosUsuario (
    TelefonoID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    Numero VARCHAR(20),
    Tipo VARCHAR(50)
);

-- Crear tabla TelefonosEmpresa
CREATE TABLE TelefonosEmpresa (
    TelefonoID INT PRIMARY KEY AUTO_INCREMENT,
    EmpresaID INT,
    Numero VARCHAR(20),
    Tipo VARCHAR(50)
);

-- Crear tabla TelefonosProveedores
CREATE TABLE TelefonosProveedores (
    TelefonoID INT PRIMARY KEY AUTO_INCREMENT,
    ProveedorID INT,
    Numero VARCHAR(20),
    Emergencia BOOLEAN
);

-- Crear tabla Eventos
CREATE TABLE Eventos (
    EventoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Tipo VARCHAR(50),
    Fecha DATE,
    LugarID INT,
    ClienteID INT,
    Descripcion TEXT
);

-- Crear tabla Presupuestos
CREATE TABLE Presupuestos (
    PresupuestoID INT PRIMARY KEY AUTO_INCREMENT,
    EventoID INT,
    EmpresaID INT,
    Monto DECIMAL(10,2),
    FechaEnvio DATE,
    Descripcion TEXT
);

-- Crear tabla Planificaciones
CREATE TABLE Planificaciones (
    PlanificacionID INT PRIMARY KEY AUTO_INCREMENT,
    EventoID INT,
    ProveedorID INT,
    Tipo VARCHAR(50),
    Detalles TEXT
);

-- Crear tabla RolPermiso
CREATE TABLE RolPermiso (
    RolPermisoID INT PRIMARY KEY AUTO_INCREMENT,
    RolID INT,
    PermisoID INT
);

-- Agregar llaves foráneas a la tabla Usuarios
ALTER TABLE Usuarios
ADD CONSTRAINT FK_Usuarios_Roles FOREIGN KEY (RolID) REFERENCES Roles(RolID);

-- Agregar llaves foráneas a la tabla TelefonosUsuario
ALTER TABLE TelefonosUsuario
ADD CONSTRAINT FK_TelefonosUsuario_Usuarios FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID);

-- Agregar llaves foráneas a la tabla TelefonosEmpresa
ALTER TABLE TelefonosEmpresa
ADD CONSTRAINT FK_TelefonosEmpresa_EmpresasOrganizadoras FOREIGN KEY (EmpresaID) REFERENCES EmpresasOrganizadoras(EmpresaID);

-- Agregar llaves foráneas a la tabla TelefonosProveedores
ALTER TABLE TelefonosProveedores
ADD CONSTRAINT FK_TelefonosProveedores_Proveedores FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID);

-- Agregar llaves foráneas a la tabla Eventos
ALTER TABLE Eventos
ADD CONSTRAINT FK_Eventos_Lugares FOREIGN KEY (LugarID) REFERENCES Lugares(LugarID),
ADD CONSTRAINT FK_Eventos_Usuarios FOREIGN KEY (ClienteID) REFERENCES Usuarios(UsuarioID);

-- Agregar llaves foráneas a la tabla Presupuestos
ALTER TABLE Presupuestos
ADD CONSTRAINT FK_Presupuestos_Eventos FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
ADD CONSTRAINT FK_Presupuestos_EmpresasOrganizadoras FOREIGN KEY (EmpresaID) REFERENCES EmpresasOrganizadoras(EmpresaID);

-- Agregar llaves foráneas a la tabla Planificaciones
ALTER TABLE Planificaciones
ADD CONSTRAINT FK_Planificaciones_Eventos FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
ADD CONSTRAINT FK_Planificaciones_Proveedores FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID);

-- Agregar llaves foráneas a la tabla RolPermiso
ALTER TABLE RolPermiso
ADD CONSTRAINT FK_RolPermiso_Roles FOREIGN KEY (RolID) REFERENCES Roles(RolID),
ADD CONSTRAINT FK_RolPermiso_Permisos FOREIGN KEY (PermisoID) REFERENCES Permisos(PermisoID);


