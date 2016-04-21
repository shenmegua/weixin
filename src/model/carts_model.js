// Generated by CoffeeScript 1.10.0
(function() {
  var Carts, Schema, mongodb, mongoose;

  mongodb = require('../mongodb');

  mongoose = mongodb.mongoose;

  Schema = mongoose.Schema;

  Carts = new Schema({
    uId: String,
    cId: String,
    cName: String,
    cPrice: Number,
    cImgId: String,
    cQuantity: Number,
    cStatus: Boolean,
    Default: false
  });

  module.exports = mongoose.module('carts', Carts);

}).call(this);
