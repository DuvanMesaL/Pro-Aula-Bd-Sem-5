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


