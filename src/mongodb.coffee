mongoose = require 'mongoose'
connection = mongoose.connect 'mongodb://localhost:27017/weixin'
module.exports.mongoose = mongoose