
-- Tabla para registro ISO (empresas)
CREATE TABLE IF NOT EXISTS empresas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  razon_social VARCHAR(255) NOT NULL,
  nit VARCHAR(50) NOT NULL,
  representante_legal VARCHAR(255),
  sector_economico VARCHAR(100),
  tipo_empresa VARCHAR(100),
  direccion VARCHAR(255),
  telefonos VARCHAR(100),
  num_empleados INT,
  email VARCHAR(100),
  web VARCHAR(100),
  facebook VARCHAR(100),
  instagram VARCHAR(100),
  whatsapp VARCHAR(100),
  tiktok VARCHAR(100)
);

-- CREAR BASE DE DATOS Y USUARIO DESDE CERO PARA AUDITORÍA ISO 9001

-- 1. Crear la base de datos
DROP DATABASE IF EXISTS auditorias_iso9001;
CREATE DATABASE auditorias_iso9001 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE auditorias_iso9001;

-- 2. Crear usuario y dar permisos (ajusta la contraseña a tu preferencia)
DROP USER IF EXISTS 'auditor'@'localhost';
CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'auditor123';
GRANT ALL PRIVILEGES ON auditorias_iso9001.* TO 'auditor'@'localhost';
FLUSH PRIVILEGES;

-- 3. Crear tabla checklist_auditoria_iso9001
CREATE TABLE checklist_auditoria_iso9001 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_4_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_4_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_4_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_4_4 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_5_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_5_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_5_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_5_4_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_5_4_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_5_5 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_6_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_6_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_6_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_1_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_1_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_1_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_1_4 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_1_5 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_1_6 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_4 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_5_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_5_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_7_5_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_2_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_2_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_2_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_2_4 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_3_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_3_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_3_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_3_4 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_3_5 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_3_6 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_4_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_4_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_4_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_5_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_5_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_5_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_5_4 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_5_5 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_5_6 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_6 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_8_7 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_1_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_1_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_1_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_3_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_3_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_9_3_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_10_1 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_10_2 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  item_10_3 ENUM('cumple','no_cumple','no_aplica') NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  observaciones TEXT
);

-- Puedes agregar más columnas para otros ítems según el anexo si es necesario.
