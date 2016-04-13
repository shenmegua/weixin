// Generated by CoffeeScript 1.10.0
(function() {
  var Schema, User, mongodb, mongoose;

  mongodb = require('../mongodb');

  mongoose = mongodb.mongoose;

  Schema = mongoose.Schema;

  User = new Schema({
    userid: String,
    name: String,
    passwd: String,
    email: String
  });

  module.exports = mongoose.model('user', User);

}).call(this);
