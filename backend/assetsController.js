const express = require('express');
const router = express.Router();
const mysql = require('mysql');


const connection = mysql.createConnection({
    host: 'localhost',
    user: '',
    password: '',
    database: 'dashboard'
});


connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL: ', err);
        return;
    }
    console.log('Connected to MySQL database');
});


function getAssets(callback) {
    const query = 'SELECT * FROM assets';
    connection.query(query, (err, results) => {
        if (err) {
            console.error('Error querying assets: ', err);
            callback(err, null);
            return;
        }
        callback(null, results);
    });
}


router.get('/', (req, res) => {
    getAssets((err, assets) => {
        if (err) {
            res.status(500).json({ error: 'Failed to retrieve assets' });
            return;
        }
        res.json(assets);
    });
});


module.exports = router;
