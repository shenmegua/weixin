UserService = require '../service/user_service'

module.exports.find_user = (req, res, cbf) ->
  name = req.body?.name
  passwd = req.body?.passwd
  # 查询条件
  params = 
    name : name
    passwd : passwd

  UserService.findOneUser params, cbf

module.exports.save = (req, res, cbf) ->
  params = {}
  params.userid = req.body?.userid or ''
  params.name = req.body?.name or ''
  params.passwd = req.body?.passwd or ''
  params.email = req.body?.email or ''

  UserService.addUser params, cbf

module.exports.findAllUser = (req, res, cbf) ->
  params = {}
  params.name = req.body?.name or req.params?.name or req.query?.name or ''

  UserService params, cbf

module.exports.remove = (req, res, cbf) ->
  params = {}
  params._id = req.body?._id or req.query?._id or req.params?._id
  
  UserService.deleteUser params, cbf