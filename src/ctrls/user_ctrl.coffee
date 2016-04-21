UserService = require '../service/user_service'

module.exports.find_user = (req, res, cbf) ->
  console.log "req.body:", req.body
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