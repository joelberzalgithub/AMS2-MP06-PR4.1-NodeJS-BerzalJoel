const Post = require('../models/post');

// Funció per obtenir tots els usuaris
exports.getAllPosts = async (req, res) => {
  try {
    const posts = await Post.find({});
    res.json(posts);
  } catch (err) {
    res.status(500).send(err.message);
  }
};
