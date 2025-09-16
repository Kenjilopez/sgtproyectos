// Endpoint para crear una nueva base de datos desde la app (requiere permisos de root)
app.post('/api/crear-bd', (req, res) => {
  const { nombreBD } = req.body;
  const sql = `CREATE DATABASE IF NOT EXISTS \`${nombreBD}\``;
  // Se requiere conexión como root para crear bases de datos
  const dbRoot = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123'
  });
  dbRoot.query(sql, (err, result) => {
    dbRoot.end();
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.json({ success: true, message: `Base de datos '${nombreBD}' creada` });
    }
  });
});

// Tabla y endpoint para usuarios/login
// 1. Crear tabla usuarios si no existe
const crearTablaUsuarios = () => {
  const sql = `CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
  )`;
  db.query(sql, err => {
    if (err) console.error('Error creando tabla usuarios:', err);
  });
};
crearTablaUsuarios();

// 2. Endpoint para registrar usuario
const bcrypt = require('bcrypt');
app.post('/api/registro-usuario', async (req, res) => {
  const { username, password } = req.body;
  const hash = await bcrypt.hash(password, 10);
  db.query('INSERT INTO usuarios (username, password) VALUES (?, ?)', [username, hash], (err, result) => {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.json({ success: true, id: result.insertId });
    }
  });
});

// 3. Endpoint para login
app.post('/api/login', (req, res) => {
  const { username, password } = req.body;
  db.query('SELECT * FROM usuarios WHERE username = ?', [username], async (err, results) => {
    if (err) {
      res.status(500).json({ error: err });
    } else if (results.length === 0) {
      res.status(401).json({ error: 'Usuario no encontrado' });
    } else {
      const usuario = results[0];
      const match = await bcrypt.compare(password, usuario.password);
      if (match) {
        res.json({ success: true, user: { id: usuario.id, username: usuario.username } });
      } else {
        res.status(401).json({ error: 'Contraseña incorrecta' });
      }
    }
  });
});
// Endpoint para guardar checklist de auditoría ISO 9001 (solo ítems de la lista)
app.post('/api/checklist', (req, res) => {
  const data = req.body;
  const sql = `INSERT INTO checklist_auditoria_iso9001 (
    item_4_1, item_4_2, item_4_3, item_4_4, item_5_1, item_5_2, item_5_3,
    item_6_1, item_6_2, item_6_3, item_7_1, item_7_2, item_7_3, item_7_4, item_7_5,
    item_8_1, item_8_2, item_8_3, item_8_4, item_8_5, item_8_6, item_8_7,
    item_9_1, item_9_2, item_9_3, item_10_1, item_10_2, item_10_3
  ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [
    data.item_4_1, data.item_4_2, data.item_4_3, data.item_4_4, data.item_5_1, data.item_5_2, data.item_5_3,
    data.item_6_1, data.item_6_2, data.item_6_3, data.item_7_1, data.item_7_2, data.item_7_3, data.item_7_4, data.item_7_5,
    data.item_8_1, data.item_8_2, data.item_8_3, data.item_8_4, data.item_8_5, data.item_8_6, data.item_8_7,
    data.item_9_1, data.item_9_2, data.item_9_3, data.item_10_1, data.item_10_2, data.item_10_3
  ];
  db.query(sql, values, (err, result) => {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.json({ success: true, id: result.insertId });
    }
  });
});
// Backend básico para conectar a MySQL y exponer una API
const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Cambia estos datos según tu configuración
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root123', // Cambia si tienes contraseña
  database: 'auditorias_iso9001'
});

db.connect(err => {
  if (err) {
    console.error('Error de conexión a MySQL:', err);
  } else {
    console.log('Conectado a MySQL');
  }
});

// Ejemplo de endpoint para obtener datos de una tabla
app.get('/api/auditorias', (req, res) => {
  db.query('SELECT * FROM auditorias', (err, results) => {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.json(results);
    }
  });
});

const PORT = 3001;
app.listen(PORT, () => {
  console.log(`Servidor backend escuchando en puerto ${PORT}`);
});


// Endpoint para guardar registro ISO
app.post('/api/registro-iso', (req, res) => {
  const data = req.body;
  const sql = `INSERT INTO empresas (razon_social, nit, representante_legal, sector_economico, tipo_empresa)
    VALUES (?, ?, ?, ?, ?)`;
  const values = [
    data.razonSocial,
    data.nit,
    data.representanteLegal,
    data.sectorEconomico,
    data.tipoEmpresa
  ];
  db.query(sql, values, (err, result) => {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.json({ success: true, id: result.insertId });
    }
  });
});
