const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const User = require("../models/users.model");

const Session = Schema({
  username: String,
  title: String,
  description: String,
  members: [
    {
      username: String
    },
  
  ],
});

module.exports = mongoose.model("Session", Session);
