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



-- WAYS TO INSERT DATA ON DATABASE

-- 	�##	1. SQL Queries to insert Data  �##

-- #### Table Roles ####
INSERT INTO Roles (Nombre) VALUES ('Administrador');
INSERT INTO Roles (Nombre) VALUES ('Usuario');

-- #### Table Permisos ####
INSERT INTO Permisos (Nombre) VALUES ('Leer');
INSERT INTO Permisos (Nombre) VALUES ('Escribir');

-- #### Table Usuarios ####
INSERT INTO Usuarios (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Correo, Contraseña, Calle, Ciudad, Estado, CodigoPostal, RolID)
VALUES ('Juan', 'Carlos', 'Pérez', 'García', 'juan.perez@example.com', 'password123', 'Calle Falsa 123', 'Ciudad', 'Estado', '12345', 1);
INSERT INTO Usuarios (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Correo, Contraseña, Calle, Ciudad, Estado, CodigoPostal, RolID)
VALUES ('María', 'Luisa', 'Martínez', 'López', 'maria.martinez@example.com', 'password123', 'Avenida Siempre Viva 742', 'Otra Ciudad', 'Otro Estado', '54321', 2);

-- #### Table EmpresasOrganizadoras ####
INSERT INTO EmpresasOrganizadoras (Nombre, Correo, Calle, Ciudad, Estado, CodigoPostal, Descripcion)
VALUES ('Empresa A', 'contacto@empresaa.com', 'Calle Empresa 1', 'Ciudad A', 'Estado A', '11111', 'Descripción de Empresa A');
INSERT INTO EmpresasOrganizadoras (Nombre, Correo, Calle, Ciudad, Estado, CodigoPostal, Descripcion)
VALUES ('Empresa B', 'contacto@empresab.com', 'Calle Empresa 2', 'Ciudad B', 'Estado B', '22222', 'Descripción de Empresa B');

-- #### Table Lugares ####
INSERT INTO Lugares (Nombre, Calle, Ciudad, Estado, CodigoPostal, Tipo, Capacidad, Descripcion)
VALUES ('Lugar A', 'Calle Lugar 1', 'Ciudad A', 'Estado A', '11111', 'Tipo A', 100, 'Descripción del Lugar A');
INSERT INTO Lugares (Nombre, Calle, Ciudad, Estado, CodigoPostal, Tipo, Capacidad, Descripcion)
VALUES ('Lugar B', 'Calle Lugar 2', 'Ciudad B', 'Estado B', '22222', 'Tipo B', 200, 'Descripción del Lugar B');

-- #### Table Proveedores ####
INSERT INTO Proveedores (Nombre, Correo, Tipo, Descripcion)
VALUES ('Proveedor A', 'contacto@proveedora.com', 'Tipo A', 'Descripción del Proveedor A');
INSERT INTO Proveedores (Nombre, Correo, Tipo, Descripcion)
VALUES ('Proveedor B', 'contacto@proveedorb.com', 'Tipo B', 'Descripción del Proveedor B');

-- #### Table TelefonosUsuario ####
INSERT INTO TelefonosUsuario (UsuarioID, Numero, Tipo)
VALUES (1, '1234567890', 'Móvil');
INSERT INTO TelefonosUsuario (UsuarioID, Numero, Tipo)
VALUES (2, '0987654321', 'Casa');

-- #### Table TelefonosEmpresa ####
INSERT INTO TelefonosEmpresa (EmpresaID, Numero, Tipo)
VALUES (1, '1234567890', 'Oficina');
INSERT INTO TelefonosEmpresa (EmpresaID, Numero, Tipo)
VALUES (2, '0987654321', 'Soporte');

-- #### Table TelefonosProveedores ####
INSERT INTO TelefonosProveedores (ProveedorID, Numero, Emergencia)
VALUES (1, '1234567890', TRUE);
INSERT INTO TelefonosProveedores (ProveedorID, Numero, Emergencia)
VALUES (2, '0987654321', FALSE);

-- #### Table Eventos ####
INSERT INTO Eventos (Nombre, Tipo, Fecha, LugarID, ClienteID, Descripcion)
VALUES ('Evento A', 'Tipo A', '2024-06-01', 1, 1, 'Descripción del Evento A');
INSERT INTO Eventos (Nombre, Tipo, Fecha, LugarID, ClienteID, Descripcion)
VALUES ('Evento B', 'Tipo B', '2024-07-01', 2, 2, 'Descripción del Evento B');

-- #### Table Presupuestos ####
INSERT INTO Presupuestos (EventoID, EmpresaID, Monto, FechaEnvio, Descripcion)
VALUES (1, 1, 1000.00, '2024-05-19', 'Presupuesto para Evento A');
INSERT INTO Presupuestos (EventoID, EmpresaID, Monto, FechaEnvio, Descripcion)
VALUES (2, 2, 2000.00, '2024-05-20', 'Presupuesto para Evento B');

-- #### Table Planificaciones ####
INSERT INTO Planificaciones (EventoID, ProveedorID, Tipo, Detalles)
VALUES (1, 1, 'Tipo A', 'Detalles de la Planificación A');
INSERT INTO Planificaciones (EventoID, ProveedorID, Tipo, Detalles)
VALUES (2, 2, 'Tipo B', 'Detalles de la Planificación B');

-- #### Table RolPermiso ####
INSERT INTO RolPermiso (RolID, PermisoID)
VALUES (1, 1);
INSERT INTO RolPermiso (RolID, PermisoID)
VALUES (2, 2);



-- 	�##	2. SQL SCRIP to insert Data  �##


-- #### Insert data into tablea Roles ####
INSERT INTO Roles (Nombre) VALUES ('Administrador');
INSERT INTO Roles (Nombre) VALUES ('Usuario');

-- #### Insert data into table Permisos ####
INSERT INTO Permisos (Nombre) VALUES ('Leer');
INSERT INTO Permisos (Nombre) VALUES ('Escribir');

-- #### Insert data into table Usuarios ####
INSERT INTO Usuarios (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Correo, Contraseña, Calle, Ciudad, Estado, CodigoPostal, RolID)
VALUES ('Juan', 'Carlos', 'Pérez', 'García', 'juan.perez@example.com', 'password123', 'Calle Falsa 123', 'Ciudad', 'Estado', '12345', 1);
INSERT INTO Usuarios (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Correo, Contraseña, Calle, Ciudad, Estado, CodigoPostal, RolID)
VALUES ('María', 'Luisa', 'Martínez', 'López', 'maria.martinez@example.com', 'password123', 'Avenida Siempre Viva 742', 'Otra Ciudad', 'Otro Estado', '54321', 2);

-- #### Insert data into table EmpresasOrganizadoras ####
INSERT INTO EmpresasOrganizadoras (Nombre, Correo, Calle, Ciudad, Estado, CodigoPostal, Descripcion)
VALUES ('Empresa A', 'contacto@empresaa.com', 'Calle Empresa 1', 'Ciudad A', 'Estado A', '11111', 'Descripción de Empresa A');
INSERT INTO EmpresasOrganizadoras (Nombre, Correo, Calle, Ciudad, Estado, CodigoPostal, Descripcion)
VALUES ('Empresa B', 'contacto@empresab.com', 'Calle Empresa 2', 'Ciudad B', 'Estado B', '22222', 'Descripción de Empresa B');

-- #### Insert data into table Lugares ####
INSERT INTO Lugares (Nombre, Calle, Ciudad, Estado, CodigoPostal, Tipo, Capacidad, Descripcion)
VALUES ('Lugar A', 'Calle Lugar 1', 'Ciudad A', 'Estado A', '11111', 'Tipo A', 100, 'Descripción del Lugar A');
INSERT INTO Lugares (Nombre, Calle, Ciudad, Estado, CodigoPostal, Tipo, Capacidad, Descripcion)
VALUES ('Lugar B', 'Calle Lugar 2', 'Ciudad B', 'Estado B', '22222', 'Tipo B', 200, 'Descripción del Lugar B');

-- #### Insert data into table Proveedores ####
INSERT INTO Proveedores (Nombre, Correo, Tipo, Descripcion)
VALUES ('Proveedor A', 'contacto@proveedora.com', 'Tipo A', 'Descripción del Proveedor A');
INSERT INTO Proveedores (Nombre, Correo, Tipo, Descripcion)
VALUES ('Proveedor B', 'contacto@proveedorb.com', 'Tipo B', 'Descripción del Proveedor B');

-- #### Insert data into table TelefonosUsuario ####
INSERT INTO TelefonosUsuario (UsuarioID, Numero, Tipo)
VALUES (1, '1234567890', 'Móvil');
INSERT INTO TelefonosUsuario (UsuarioID, Numero, Tipo)
VALUES (2, '0987654321', 'Casa');

-- #### Insert data into table TelefonosEmpresa ####
INSERT INTO TelefonosEmpresa (EmpresaID, Numero, Tipo)
VALUES (1, '1234567890', 'Oficina');
INSERT INTO TelefonosEmpresa (EmpresaID, Numero, Tipo)
VALUES (2, '0987654321', 'Soporte');

-- #### Insert data into table TelefonosProveedores ####
INSERT INTO TelefonosProveedores (ProveedorID, Numero, Emergencia)
VALUES (1, '1234567890', TRUE);
INSERT INTO TelefonosProveedores (ProveedorID, Numero, Emergencia)
VALUES (2, '0987654321', FALSE);

-- #### Insert data into table Eventos ####
INSERT INTO Eventos (Nombre, Tipo, Fecha, LugarID, ClienteID, Descripcion)
VALUES ('Evento A', 'Tipo A', '2024-06-01', 1, 1, 'Descripción del Evento A');
INSERT INTO Eventos (Nombre, Tipo, Fecha, LugarID, ClienteID, Descripcion)
VALUES ('Evento B', 'Tipo B', '2024-07-01', 2, 2, 'Descripción del Evento B');

-- #### Insert data into table Presupuestos ####
INSERT INTO Presupuestos (EventoID, EmpresaID, Monto, FechaEnvio, Descripcion)
VALUES (1, 1, 1000.00, '2024-05-19', 'Presupuesto para Evento A');
INSERT INTO Presupuestos (EventoID, EmpresaID, Monto, FechaEnvio, Descripcion)
VALUES (2, 2, 2000.00, '2024-05-20', 'Presupuesto para Evento B');

-- #### Insert data into table Planificaciones ####
INSERT INTO Planificaciones (EventoID, ProveedorID, Tipo, Detalles)
VALUES (1, 1, 'Tipo A', 'Detalles de la Planificación A');
INSERT INTO Planificaciones (EventoID, ProveedorID, Tipo, Detalles)
VALUES (2, 2, 'Tipo B', 'Detalles de la Planificación B');

-- #### Insert data into table RolPermiso ####
INSERT INTO RolPermiso (RolID, PermisoID)
VALUES (1, 1);
INSERT INTO RolPermiso (RolID, PermisoID)
VALUES (2, 2);


-- 	�##	3. STORED PROCEDURE to insert Data  �##

-- #### Stored Procedure Table Roles ####

DELIMITER //

CREATE PROCEDURE InsertarRol (
    IN p_Nombre VARCHAR(50)
)
BEGIN
    INSERT INTO Roles (Nombre) VALUES (p_Nombre);
END //

DELIMITER ;

-- #### Stored Procedure Table Permisos ####
DELIMITER //

CREATE PROCEDURE InsertarPermiso (
    IN p_Nombre VARCHAR(50)
)
BEGIN
    INSERT INTO Permisos (Nombre) VALUES (p_Nombre);
END //

DELIMITER ;

-- #### Stored Procedure Table Usuarios ####

DELIMITER //

CREATE PROCEDURE InsertarUsuario (
    IN p_PrimerNombre VARCHAR(255),
    IN p_SegundoNombre VARCHAR(255),
    IN p_PrimerApellido VARCHAR(255),
    IN p_SegundoApellido VARCHAR(255),
    IN p_Correo VARCHAR(255),
    IN p_Contraseña VARCHAR(255),
    IN p_Calle VARCHAR(255),
    IN p_Ciudad VARCHAR(100),
    IN p_Estado VARCHAR(100),
    IN p_CodigoPostal VARCHAR(10),
    IN p_RolID INT
)
BEGIN
    INSERT INTO Usuarios (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Correo, Contraseña, Calle, Ciudad, Estado, CodigoPostal, RolID)
    VALUES (p_PrimerNombre, p_SegundoNombre, p_PrimerApellido, p_SegundoApellido, p_Correo, p_Contraseña, p_Calle, p_Ciudad, p_Estado, p_CodigoPostal, p_RolID);
END //

DELIMITER ;

-- #### Stored Procedure Table EmpresasOrganizadoras ####
DELIMITER //

CREATE PROCEDURE InsertarEmpresaOrganizadora (
    IN p_Nombre VARCHAR(255),
    IN p_Correo VARCHAR(255),
    IN p_Calle VARCHAR(255),
    IN p_Ciudad VARCHAR(100),
    IN p_Estado VARCHAR(100),
    IN p_CodigoPostal VARCHAR(10),
    IN p_Descripcion TEXT
)
BEGIN
    INSERT INTO EmpresasOrganizadoras (Nombre, Correo, Calle, Ciudad, Estado, CodigoPostal, Descripcion)
    VALUES (p_Nombre, p_Correo, p_Calle, p_Ciudad, p_Estado, p_CodigoPostal, p_Descripcion);
END //

DELIMITER ;


-- #### Stored Procedure Table Lugares ####
DELIMITER //

CREATE PROCEDURE InsertarLugar (
    IN p_Nombre VARCHAR(255),
    IN p_Calle VARCHAR(255),
    IN p_Ciudad VARCHAR(100),
    IN p_Estado VARCHAR(100),
    IN p_CodigoPostal VARCHAR(10),
    IN p_Tipo VARCHAR(50),
    IN p_Capacidad INT,
    IN p_Descripcion TEXT
)
BEGIN
    INSERT INTO Lugares (Nombre, Calle, Ciudad, Estado, CodigoPostal, Tipo, Capacidad, Descripcion)
    VALUES (p_Nombre, p_Calle, p_Ciudad, p_Estado, p_CodigoPostal, p_Tipo, p_Capacidad, p_Descripcion);
END //

DELIMITER ;

-- #### Stored Procedure Table Proveedores ####

DELIMITER //

CREATE PROCEDURE InsertarProveedor (
    IN p_Nombre VARCHAR(255),
    IN p_Correo VARCHAR(255),
    IN p_Tipo VARCHAR(50),
    IN p_Descripcion TEXT
)
BEGIN
    INSERT INTO Proveedores (Nombre, Correo, Tipo, Descripcion)
    VALUES (p_Nombre, p_Correo, p_Tipo, p_Descripcion);
END //

DELIMITER ;


-- #### Stored Procedure Table TelefonosUsuario ####

DELIMITER //

CREATE PROCEDURE InsertarTelefonoUsuario (
    IN p_UsuarioID INT,
    IN p_Numero VARCHAR(20),
    IN p_Tipo VARCHAR(50)
)
BEGIN
    INSERT INTO TelefonosUsuario (UsuarioID, Numero, Tipo)
    VALUES (p_UsuarioID, p_Numero, p_Tipo);
END //

DELIMITER ;

-- #### Stored Procedure Table TelefonosEmpresa ####

DELIMITER //

CREATE PROCEDURE InsertarTelefonoEmpresa (
    IN p_EmpresaID INT,
    IN p_Numero VARCHAR(20),
    IN p_Tipo VARCHAR(50)
)
BEGIN
    INSERT INTO TelefonosEmpresa (EmpresaID, Numero, Tipo)
    VALUES (p_EmpresaID, p_Numero, p_Tipo);
END //

DELIMITER ;


-- #### Stored Procedure Table TelefonosProveedores ####

DELIMITER //

CREATE PROCEDURE InsertarTelefonoProveedor (
    IN p_ProveedorID INT,
    IN p_Numero VARCHAR(20),
    IN p_Emergencia BOOLEAN
)
BEGIN
    INSERT INTO TelefonosProveedores (ProveedorID, Numero, Emergencia)
    VALUES (p_ProveedorID, p_Numero, p_Emergencia);
END //

DELIMITER ;


-- #### Stored Procedure Table Eventos ####

DELIMITER //

CREATE PROCEDURE InsertarEvento (
    IN p_Nombre VARCHAR(255),
    IN p_Tipo VARCHAR(50),
    IN p_Fecha DATE,
    IN p_LugarID INT,
    IN p_ClienteID INT,
    IN p_Descripcion TEXT
)
BEGIN
    INSERT INTO Eventos (Nombre, Tipo, Fecha, LugarID, ClienteID, Descripcion)
    VALUES (p_Nombre, p_Tipo, p_Fecha, p_LugarID, p_ClienteID, p_Descripcion);
END //

DELIMITER ;


-- #### Stored Procedure Table Presupuestos ####

DELIMITER //

CREATE PROCEDURE InsertarPresupuesto (
    IN p_EventoID INT,
    IN p_EmpresaID INT,
    IN p_Monto DECIMAL(10,2),
    IN p_FechaEnvio DATE,
    IN p_Descripcion TEXT
)
BEGIN
    INSERT INTO Presupuestos (EventoID, EmpresaID, Monto, FechaEnvio, Descripcion)
    VALUES (p_EventoID, p_EmpresaID, p_Monto, p_FechaEnvio, p_Descripcion);
END //

DELIMITER ;


-- #### Stored Procedure Table Planificaciones ####

DELIMITER //

CREATE PROCEDURE InsertarPlanificacion (
    IN p_EventoID INT,
    IN p_ProveedorID INT,
    IN p_Tipo VARCHAR(50),
    IN p_Detalles TEXT
)
BEGIN
    INSERT INTO Planificaciones (EventoID, ProveedorID, Tipo, Detalles)
    VALUES (p_EventoID, p_ProveedorID, p_Tipo, p_Detalles);
END //

DELIMITER ;

-- #### Stored Procedure Table RolPermiso ####

DELIMITER //

CREATE PROCEDURE InsertarRolPermiso (
    IN p_RolID INT,
    IN p_PermisoID INT
)
BEGIN
    INSERT INTO RolPermiso (RolID, PermisoID)
    VALUES (p_RolID, p_PermisoID);
END //

DELIMITER ;


-- Call InsertarRol to insert data into rol
CALL InsertarRol('Moderador');

-- Call InsertarPermiso to insert data intoo permiso
CALL InsertarPermiso('Eliminar');

-- Call InsertarUsuario to insert data into usuario
CALL InsertarUsuario('Luis', 'Fernando', 'Gómez', 'Pérez', 'luis.gomez@example.com', 'password123', 'Calle Nueva 123', 'Ciudad X', 'Estado Y', '67890', 1);

-- Call InsertarEmpresaOrganizadora to insert data into organizadora
CALL InsertarEmpresaOrganizadora('Empresa C', 'contacto@empresac.com', 'Calle Empresa 3', 'Ciudad C', 'Estado C', '33333', 'Descripción de Empresa C');

-- Call InsertarLugar to insert data into lugar
CALL InsertarLugar('Lugar C', 'Calle Lugar 3', 'Ciudad C', 'Estado C', '33333', 'Tipo C', 300, 'Descripción del Lugar C');

-- Call InsertarProveedor to insert data into proveedor
CALL InsertarProveedor('Proveedor C', 'contacto@proveedorc.com', 'Tipo C', 'Descripción del Proveedor C');

-- Call InsertarTelefonoUsuario to insert data into usuario
CALL InsertarTelefonoUsuario(1, '1122334455', 'Trabajo');

-- Call InsertarTelefonoEmpresa to insert data into empresa
CALL InsertarTelefonoEmpresa(1, '2233445566', 'Ventas');

-- Call InsertarTelefonoProveedor to insert data into proveedor
CALL InsertarTelefonoProveedor(1, '3344556677', TRUE);

-- Call InsertarEvento to insert data into evento
CALL InsertarEvento('Evento C', 'Tipo C', '2024-08-01', 1, 1, 'Descripción del Evento C');

-- Call InsertarPresupuesto to insert data into presupuesto
CALL InsertarPresupuesto(1, 1, 1500.00, '2024-06-19', 'Presupuesto para Evento C');

-- Call InsertarPlanificacion to insert data into planificación
CALL InsertarPlanificacion(1, 1, 'Tipo C', 'Detalles de la Planificación C');

-- Call InsertarRolPermiso to insert data into rol-permiso
CALL InsertarRolPermiso(1, 2);



-- #### WAYS TO GET DATA ####
-- 1. Basic Column Selection

-- Select all columns
SELECT * FROM Usuarios;
SELECT * FROM Eventos;
SELECT * FROM Proveedores;
SELECT * FROM Lugares;
SELECT * FROM EmpresasOrganizadoras;

-- Select specific columns
SELECT PrimerNombre, PrimerApellido FROM Usuarios;
SELECT Nombre, Tipo FROM Eventos;
SELECT Nombre, Correo FROM Proveedores;
SELECT Nombre, Capacidad FROM Lugares;
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras;

-- 2. Using Aliases for Columns and Tables

-- Column aliases
SELECT PrimerNombre AS Nombre, PrimerApellido AS Apellido FROM Usuarios;
SELECT Nombre AS EventoNombre, Tipo AS EventoTipo FROM Eventos;
SELECT Nombre AS ProveedorNombre, Correo AS ProveedorCorreo FROM Proveedores;
SELECT Nombre AS LugarNombre, Capacidad AS LugarCapacidad FROM Lugares;
SELECT Nombre AS EmpresaNombre, Ciudad AS EmpresaCiudad FROM EmpresasOrganizadoras;

-- Table aliases
SELECT u.PrimerNombre, u.PrimerApellido FROM Usuarios u;
SELECT e.Nombre, e.Tipo FROM Eventos e;
SELECT p.Nombre, p.Correo FROM Proveedores p;
SELECT l.Nombre, l.Capacidad FROM Lugares l;
SELECT eo.Nombre, eo.Ciudad FROM EmpresasOrganizadoras eo;

-- 3. Filtering Results with WHERE

-- Simple condition
SELECT PrimerNombre, PrimerApellido FROM Usuarios WHERE Ciudad = 'Ciudad A';
SELECT Nombre, Tipo FROM Eventos WHERE Tipo = 'Boda';
SELECT Nombre, Correo FROM Proveedores WHERE Tipo = 'Fotógrafo';
SELECT Nombre, Capacidad FROM Lugares WHERE Capacidad > 100;
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras WHERE Estado = 'Estado A';

-- Compound condition
SELECT PrimerNombre, PrimerApellido FROM Usuarios WHERE Ciudad = 'Ciudad A' AND Estado = 'Estado A';
SELECT Nombre, Tipo FROM Eventos WHERE Tipo = 'Boda' OR Tipo = 'Cumpleaños';
SELECT Nombre, Correo FROM Proveedores WHERE Tipo = 'Fotógrafo' AND Ciudad = 'Ciudad A';
SELECT Nombre, Capacidad FROM Lugares WHERE Capacidad > 100 AND Estado = 'Estado A';
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras WHERE Estado = 'Estado A' AND CodigoPostal = '12345';

-- 4. Ordering Results with ORDER BY

-- Order ascending
SELECT PrimerNombre, PrimerApellido FROM Usuarios ORDER BY PrimerApellido ASC;
SELECT Nombre, Tipo FROM Eventos ORDER BY Fecha ASC;
SELECT Nombre, Correo FROM Proveedores ORDER BY Nombre ASC;
SELECT Nombre, Capacidad FROM Lugares ORDER BY Capacidad ASC;
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras ORDER BY Ciudad ASC;

-- Order descending
SELECT PrimerNombre, PrimerApellido FROM Usuarios ORDER BY PrimerApellido DESC;
SELECT Nombre, Tipo FROM Eventos ORDER BY Fecha DESC;
SELECT Nombre, Correo FROM Proveedores ORDER BY Nombre DESC;
SELECT Nombre, Capacidad FROM Lugares ORDER BY Capacidad DESC;
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras ORDER BY Ciudad DESC;

-- 5. Limiting Results with LIMIT

-- Select a limited number of rows
SELECT PrimerNombre, PrimerApellido FROM Usuarios LIMIT 10;
SELECT Nombre, Tipo FROM Eventos LIMIT 5;
SELECT Nombre, Correo FROM Proveedores LIMIT 8;
SELECT Nombre, Capacidad FROM Lugares LIMIT 3;
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras LIMIT 7;

-- Select a range of rows
SELECT PrimerNombre, PrimerApellido FROM Usuarios LIMIT 5 OFFSET 10; -- From row 11 to row 15
SELECT Nombre, Tipo FROM Eventos LIMIT 3 OFFSET 2; -- From row 3 to row 5
SELECT Nombre, Correo FROM Proveedores LIMIT 4 OFFSET 1; -- From row 2 to row 5
SELECT Nombre, Capacidad FROM Lugares LIMIT 6 OFFSET 3; -- From row 4 to row 9
SELECT Nombre, Ciudad FROM EmpresasOrganizadoras LIMIT 2 OFFSET 5; -- From row 6 to row 7

-- 6. Grouping Results with GROUP BY

-- Group by a column
SELECT Ciudad, COUNT(*) FROM Usuarios GROUP BY Ciudad;
SELECT Tipo, COUNT(*) FROM Eventos GROUP BY Tipo;
SELECT Tipo, COUNT(*) FROM Proveedores GROUP BY Tipo;
SELECT Estado, COUNT(*) FROM Lugares GROUP BY Estado;
SELECT Ciudad, COUNT(*) FROM EmpresasOrganizadoras GROUP BY Ciudad;

-- Group and apply aggregation functions
SELECT Ciudad, AVG(Edad) FROM Usuarios GROUP BY Ciudad;
SELECT Tipo, COUNT(*) FROM Eventos GROUP BY Tipo;
SELECT Tipo, SUM(Precio) FROM Proveedores GROUP BY Tipo;
SELECT Estado, MAX(Capacidad) FROM Lugares GROUP BY Estado;
SELECT Ciudad, MIN(Empleados) FROM EmpresasOrganizadoras GROUP BY Ciudad;

-- 7. Filtering Groups with HAVING

-- Using HAVING with GROUP BY
SELECT Ciudad, COUNT(*) FROM Usuarios GROUP BY Ciudad HAVING COUNT(*) > 10;
SELECT Tipo, COUNT(*) FROM Eventos GROUP BY Tipo HAVING COUNT(*) > 2;
SELECT Tipo, COUNT(*) FROM Proveedores GROUP BY Tipo HAVING COUNT(*) > 5;
SELECT Estado, COUNT(*) FROM Lugares GROUP BY Estado HAVING COUNT(*) > 3;
SELECT Ciudad, COUNT(*) FROM EmpresasOrganizadoras GROUP BY Ciudad HAVING COUNT(*) > 1;

-- 8. Joins to Combine Data from Multiple Tables

-- INNER JOIN
SELECT u.PrimerNombre, u.PrimerApellido, e.Nombre AS Evento
FROM Usuarios u
INNER JOIN Eventos e ON u.UsuarioID = e.ClienteID;

SELECT e.Nombre AS Evento, l.Nombre AS Lugar
FROM Eventos e
INNER JOIN Lugares l ON e.LugarID = l.LugarID;

SELECT p.Nombre AS Proveedor, eo.Nombre AS Empresa
FROM Proveedores p
INNER JOIN EmpresasOrganizadoras eo ON p.EmpresaID = eo.EmpresaID;

SELECT u.PrimerNombre, u.PrimerApellido, r.Nombre AS Rol
FROM Usuarios u
INNER JOIN Roles r ON u.RolID = r.RolID;

SELECT pp.Detalles, p.Nombre AS Proveedor
FROM Planificaciones pp
INNER JOIN Proveedores p ON pp.ProveedorID = p.ProveedorID;

-- LEFT JOIN
SELECT u.PrimerNombre, u.PrimerApellido, e.Nombre AS Evento
FROM Usuarios u
LEFT JOIN Eventos e ON u.UsuarioID = e.ClienteID;

SELECT e.Nombre AS Evento, l.Nombre AS Lugar
FROM Eventos e
LEFT JOIN Lugares l ON e.LugarID = l.LugarID;

SELECT p.Nombre AS Proveedor, eo.Nombre AS Empresa
FROM Proveedores p
LEFT JOIN EmpresasOrganizadoras eo ON p.EmpresaID = eo.EmpresaID;

SELECT u.PrimerNombre, u.PrimerApellido, r.Nombre AS Rol
FROM Usuarios u
LEFT JOIN Roles r ON u.RolID = r.RolID;

SELECT pp.Detalles, p.Nombre AS Proveedor
FROM Planificaciones pp
LEFT JOIN Proveedores p ON pp.ProveedorID = p.ProveedorID;

-- RIGHT JOIN
SELECT u.PrimerNombre, u.PrimerApellido, e.Nombre AS Evento
FROM Usuarios u
RIGHT JOIN Eventos e ON u.UsuarioID = e.ClienteID;

SELECT e.Nombre AS Evento, l.Nombre AS Lugar
FROM Eventos e
RIGHT JOIN Lugares l ON e.LugarID = l.LugarID;

SELECT p.Nombre AS Proveedor, eo.Nombre AS Empresa
FROM Proveedores p
RIGHT JOIN EmpresasOrganizadoras eo ON p.EmpresaID = eo.EmpresaID;

SELECT u.PrimerNombre, u.PrimerApellido, r.Nombre AS Rol
FROM Usuarios u
RIGHT JOIN Roles r ON u.RolID = r.RolID;

SELECT pp.Detalles, p.Nombre AS Proveedor
FROM Planificaciones pp
RIGHT JOIN Proveedores p ON pp.ProveedorID = p.ProveedorID;

-- 9. Subqueries (Subconsultas)

-- Subquery in SELECT
SELECT u.PrimerNombre, u.PrimerApellido, 
(SELECT COUNT(*) FROM Eventos e WHERE e.ClienteID = u.UsuarioID) AS TotalEventos
FROM Usuarios u;

SELECT e.Nombre, e.Fecha, 
(SELECT l.Nombre FROM Lugares l WHERE l.LugarID = e.LugarID) AS LugarNombre
FROM Eventos e;

SELECT p.Nombre, p.Tipo, 
(SELECT COUNT(*) FROM Planificaciones pp WHERE pp.ProveedorID = p.ProveedorID) AS TotalPlanificaciones
FROM Proveedores p;

SELECT l.Nombre, l.Capacidad, 
(SELECT COUNT(*) FROM Eventos e WHERE e.LugarID = l.LugarID) AS TotalEventos
FROM Lugares l;

SELECT eo.Nombre, eo.Ciudad, 
(SELECT COUNT(*) FROM Presupuestos p WHERE p.EmpresaID = eo.EmpresaID) AS TotalPresupuestos
FROM EmpresasOrganizadoras eo;
 
-- 10. Using Aggregate Functions

-- COUNT
SELECT COUNT(*) FROM Usuarios;
SELECT COUNT(*) FROM Eventos;
SELECT COUNT(*) FROM Proveedores;
SELECT COUNT(*) FROM Lugares;
SELECT COUNT(*) FROM EmpresasOrganizadoras;

-- AVG
SELECT AVG(Edad) FROM Usuarios;
SELECT AVG(Capacidad) FROM Lugares;
SELECT AVG(Monto) FROM Presupuestos;
SELECT AVG(Empleados) FROM EmpresasOrganizadoras;
SELECT AVG(Precio) FROM Proveedores;

-- SUM
SELECT SUM(Monto) FROM Presupuestos;
SELECT SUM(Capacidad) FROM Lugares;
SELECT SUM(Empleados) FROM EmpresasOrganizadoras;
SELECT SUM(Precio) FROM Proveedores;
SELECT SUM(Edad) FROM Usuarios;

-- MIN
SELECT MIN(Edad) FROM Usuarios;
SELECT MIN(Capacidad) FROM Lugares;
SELECT MIN(Monto) FROM Presupuestos;
SELECT MIN(Empleados) FROM EmpresasOrganizadoras;
SELECT MIN(Precio) FROM Proveedores;

-- MAX
SELECT MAX(Edad) FROM Usuarios;
SELECT MAX(Capacidad) FROM Lugares;
SELECT MAX(Monto) FROM Presupuestos;
SELECT MAX(Empleados) FROM EmpresasOrganizadoras;
SELECT MAX(Precio) FROM Proveedores;

-- 11. UNION Queries

-- UNION of two queries
SELECT Nombre, Ciudad FROM Usuarios
UNION
SELECT Nombre, Ciudad FROM Proveedores;

SELECT Nombre, Ciudad FROM EmpresasOrganizadoras
UNION
SELECT Nombre, Ciudad FROM Lugares;

SELECT Nombre, Tipo FROM Eventos
UNION
SELECT Nombre, Tipo FROM Planificaciones;

SELECT Nombre, Capacidad FROM Lugares
UNION
SELECT Nombre, Capacidad FROM Proveedores;

SELECT Nombre, Estado FROM EmpresasOrganizadoras
UNION
SELECT Nombre, Estado FROM Lugares;

-- UNION ALL (includes duplicates)
SELECT Nombre, Ciudad FROM Usuarios
UNION ALL
SELECT Nombre, Ciudad FROM Proveedores;

SELECT Nombre, Ciudad FROM EmpresasOrganizadoras
UNION ALL
SELECT Nombre, Ciudad FROM Lugares;

SELECT Nombre, Tipo FROM Eventos
UNION ALL
SELECT Nombre, Tipo FROM Planificaciones;

SELECT Nombre, Capacidad FROM Lugares
UNION ALL
SELECT Nombre, Capacidad FROM Proveedores;

SELECT Nombre, Estado FROM EmpresasOrganizadoras
UNION ALL
SELECT Nombre, Estado FROM Lugares;
