const mongoose = require('mongoose');

// Defineix l'esquema per Post
const PostSchema = new mongoose.Schema({
  id: {
    type: Number,
    required: true,
    unique: true // Assegura que cada post te un ID únic
  },
  title: String,
  score: Number,
  viewCount: Number,
  commentCount: Number,
  creationDate: Date,
  answerCount: Number,
  tags: [],
  ownerUserId: Number,
});

// Compila i exporta el model Post
const Post = mongoose.model('Post', PostSchema);

module.exports = Post;
