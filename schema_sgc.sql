-- Esquema mínimo para SGC (MySQL)
CREATE DATABASE IF NOT EXISTS sgc CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sgc;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  email VARCHAR(160) UNIQUE NOT NULL,
  rol ENUM('admin','calidad','auditor','usuario') DEFAULT 'usuario',
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documentos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(20) NOT NULL,
  titulo VARCHAR(255) NOT NULL,
  version VARCHAR(20) DEFAULT '0.1',
  estado ENUM('Borrador','Vigente','Obsoleto') DEFAULT 'Borrador',
  propietario VARCHAR(120),
  actualizado_en DATE
);

CREATE TABLE auditorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('Interna','Externa') NOT NULL,
  alcance VARCHAR(200) NOT NULL,
  fecha DATE NOT NULL,
  auditor VARCHAR(120) NOT NULL,
  estado ENUM('Programada','En curso','Cerrada') DEFAULT 'Programada'
);

CREATE TABLE no_conformidades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(30) UNIQUE,
  descripcion TEXT,
  severidad ENUM('Alta','Media','Baja') NOT NULL,
  responsable VARCHAR(120),
  fecha DATE,
  estado ENUM('Abierta','En análisis','Cerrada') DEFAULT 'Abierta'
);

CREATE TABLE acciones_correctivas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(30) UNIQUE,
  accion VARCHAR(255) NOT NULL,
  nc_codigo VARCHAR(30),
  responsable VARCHAR(120),
  fecha_compromiso DATE,
  estado ENUM('Pendiente','En curso','Completada') DEFAULT 'Pendiente',
  FOREIGN KEY (nc_codigo) REFERENCES no_conformidades(codigo)
);

CREATE TABLE indicadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(160) NOT NULL,
  unidad VARCHAR(30),
  valor DECIMAL(6,2),
  periodo VARCHAR(20)
);

CREATE TABLE riesgos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(160) NOT NULL,
  probabilidad ENUM('Baja','Media','Alta'),
  impacto ENUM('Bajo','Medio','Alto'),
  nivel ENUM('Verde','Amarillo','Rojo'),
  plan TEXT
);
