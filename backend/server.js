const express = require('express');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

const assetsController = require('./assetsController');

app.use(express.json());
app.use(cors());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'hanifmasy',
  password: 'dwgzrq16CM',
  database: 'dashboard'
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database: ' + err.stack);
    return;
  }
  console.log('Connected to MySQL database as id ' + db.threadId);
});

app.use('/assets', assetsController);

app.post('/signup', async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    res.status(400).json({ message: 'Username and password are required' });
  }
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    db.query('INSERT INTO users (username, password) VALUES (?, ?)', [username, hashedPassword], (err, result) => {
      if (err) {
        res.status(500).json({ message: 'Error signing up user' });
      } else {
        res.status(201).json({ message: 'User signed up successfully' });
      }
    });
  } catch (error) {
    res.status(500).send('Error signing up user');
  }
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;
  db.query('SELECT * FROM users WHERE username = ?', [username], async (err, result) => {
    if (err) {
      res.status(500).send('Error logging in');
    } else {
      if (result.length > 0) {
        const match = await bcrypt.compare(password, result[0].password);
        if (match) {
          const token = jwt.sign({ username }, 'your_secret_key');
          res.status(200).json({ token });
        } else {
          res.status(400).json({ message: 'Invalid password' });
        }
      } else {
        res.status(404).send('User not found');
      }
    }
  });
});

app.post('/logout', (req, res) => {
  res.status(200).send('Logout successful');
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
