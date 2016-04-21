CartsModel = require '../model/carts_model'

CartsService = 
  # 新增或修改购物车
  addCarts : (params, cbf) ->
    cart = new CartsModel params
    query = {_id : params._id}

    CartsModel.findOne query, (err, doc) ->
      if err
        return cbf err, null
      else
        # 如果数据已存在，则更新
        if doc and doc.length > 0
          CartsModel.findOneAndUpdate query, {$set : params}, (err, doc) ->
            if err
              return cbf err, null
            else
              return cbf null, doc

        # 如果数据不存在，则插入
        else
          cart.save (err, doc) ->
            if err
              return cbf err, null
            else
              return cbf null, doc

  # 查询
  findCarts : (params, cbf) ->
    CartsModel.find params, (err, docs) ->
      if err
        return cbf err, null
      else
        return cbf null, docs

  # 删除
  deleteCarts : (params, cbf) ->
    CartsModel.remove params, (err, doc) ->
      if err
        return cbf err, null
      else
        return cbf null, doc

module.exports = CartsService