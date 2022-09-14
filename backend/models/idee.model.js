const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const Idee = Schema({
  username:String,
  idProject:String,
  number: {
    type: Number,
    unique: true,
  },
  title: String,
  description: String,
  categorie: {
    type: String,
    default: null,
    required: false,
  },
});



module.exports = mongoose.model("Idee", Idee);

