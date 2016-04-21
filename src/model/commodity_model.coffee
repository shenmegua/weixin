mongodb = require '../mongodb'
mongoose = mongodb.mongoose
Schema = mongoose.Schema

Commodity = new Schema({
  name : String
  price : Number
  imgSrc : String
})

module.exports = mongoose.modle 'Commodity', Commodity