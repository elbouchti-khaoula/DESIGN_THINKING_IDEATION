const mongoose = require("mongoose");
const Idee = require("../models/idee.model");

const Schema = mongoose.Schema;

const User = Schema({
  username: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true ,
  },
  email: {
    type: String,
    required: true,
  },
    
});

module.exports = mongoose.model("User", User);
