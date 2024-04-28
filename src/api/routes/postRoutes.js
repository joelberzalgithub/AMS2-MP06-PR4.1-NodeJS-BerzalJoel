const express = require('express');
const router = express.Router();
// Importa el controlador
const { getAllPosts } = require('../controllers/postController');

// Utilitza el controlador per a la ruta que llista tots els posts
router.get('/posts', getAllPosts);

module.exports = router;
