-- CREATE DATABASE sistema_tickets;                   # es creada y seleccionada en otros archivos
CREATE TABLE db1.tickets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  departamento VARCHAR(255) NOT NULL,
  tipo_incidencia VARCHAR(255) NOT NULL,
  estado VARCHAR(255) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  fecha_actualizacion DATETIME NOT NULL,
  prioridad VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  usuario_creacion INT NOT NULL,
  usuario_asignado INT,
  archivos VARCHAR(255)
);
CREATE TABLE db1.usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  rol VARCHAR(255) NOT NULL
);
INSERT INTO db1.tickets (departamento, tipo_incidencia, estado, fecha_creacion, fecha_actualizacion, prioridad, descripcion, usuario_creacion)
VALUES
  ('Soporte técnico', 'Hardware', 'Abierto', '2023-11-14', '2023-11-14', 'Urgente', 'No funciona el equipo', 1),
  ('Ventas', 'Software', 'Cerrado', '2023-11-15', '2023-11-15', 'Normal', 'Problema con la licencia', 2);
INSERT INTO db1.usuarios (nombre, email, password, rol)
VALUES
  ('Juan Pérez', 'juan.perez@ejemplo.com', '123456', 'Técnico'),
  ('María López', 'maria.lopez@ejemplo.com', 'abcdef', 'Jefe de IT');
