const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const Categorie = Schema({
  title: String ,
});

module.exports = mongoose.model("Categorie", Categorie);