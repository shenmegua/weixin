UserModel = require '../model/user_model'

UserService = 
  addUser : (user, cbf) ->
    user = UserModel user
    user.save (err, doc) ->
      if err
        return cbf err, null
      else
        return cbf null, doc

  findUser : (params, cbf) ->
    UserModel.findOne params, (err, doc) ->
      if err
        return cbf err, null
      else
        return cbf null, doc

module.exports = UserService