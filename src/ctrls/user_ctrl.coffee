UserService = require '../service/user_service'

module.exports.find_user = (req, res, cbf) ->
  params = 
    userid : '1'

  UserService.findUser params, cbf