CREATE DATABASE RestauranteDB;

-- Usar la base de datos
USE RestauranteDB;

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol ENUM('ADMIN', 'CLIENTE', 'PERSONAL') NOT NULL
);

-- Tabla de Mesas
CREATE TABLE Mesas (
    id_mesa INT PRIMARY KEY AUTO_INCREMENT,
    numero_mesa INT UNIQUE NOT NULL,
    capacidad INT NOT NULL
);

-- Tabla de Reservas
CREATE TABLE Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_mesa INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    estado ENUM('PENDIENTE', 'CONFIRMADA', 'CANCELADA') DEFAULT 'PENDIENTE',
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla de Historial de Reservas
CREATE TABLE HistorialReservas (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_anterior ENUM('PENDIENTE', 'CONFIRMADA', 'CANCELADA') NOT NULL,
    estado_nuevo ENUM('PENDIENTE', 'CONFIRMADA', 'CANCELADA') NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);
