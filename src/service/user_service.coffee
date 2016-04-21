UserModel = require '../model/user_model'

UserService = 
  # 新增/修改用户
  addUser : (params, cbf) ->
    user = new UserModel params
    query = {_id : params._id}
    # 查询数据库中记录是否已存在
    UserModel.findOne query, (err, doc) ->
      if err
        return cbf err, null
      else
        # 记录已存在，则更新
        if doc and doc.length > 0
          UserModel.findOneAndUpdate query, {$set: params}, (err, doc) ->
            if err
              return cbf err, null
            else
              return cbf null, doc

        # 不存在则新增
        else    
          user.save (err, doc) ->
            if err
              return cbf err, null
            else
              return cbf null, doc

  # 查询单个用户
  findOneUser : (params, cbf) ->
    UserModel.findOne params, (err, doc) ->
      if err
        return cbf err, null
      else
        return cbf null, doc

  # 查询所有用户
  findAllUser : (params, cbf) ->
    UserModel.find params, (err, docs) ->
      if err
        return cbf err, null
      else
        return cbf null, docs

  # 删除用户
  deleteUser : (params, cbf) ->
    UserModel.remove params, (err, doc) ->
      if err
        return cbf err, null
      else
        return cbf null, doc

module.exports = UserService