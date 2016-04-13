mongodb = require '../mongodb'
mongoose = mongodb.mongoose
Schema = mongoose.Schema

User = new Schema({
  userid : String
  name : String
  passwd : String
  email : String  
})


module.exports = mongoose.model 'user', User