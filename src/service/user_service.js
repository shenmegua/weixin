// Generated by CoffeeScript 1.10.0
(function() {
  var UserModel, UserService;

  UserModel = require('../model/user_model');

  UserService = {
    addUser: function(user, cbf) {
      user = UserModel(user);
      return user.save(function(err, doc) {
        if (err) {
          return cbf(err, null);
        } else {
          return cbf(null, doc);
        }
      });
    },
    findUser: function(params, cbf) {
      return UserModel.find(params, function(err, doc) {
        if (err) {
          return cbf(err, null);
        } else {
          return cbf(null, doc);
        }
      });
    }
  };

  module.exports = UserService;

}).call(this);
