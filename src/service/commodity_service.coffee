CommodityModel = require '../model/commodity_model'

CommodityServices =
  # 新增或修改商品信息 
  addCommodity : (params, cbf) ->
    commodity = new CommodityModel params
    query = {_id : params._id}
    # 查找数据库中是否已存在记录
    CommodityModel.findOne query, (err, doc) ->
      if err
        return cbf err, null
      else
        # 记录已存在，则更新
        if doc and doc.length > 0
          CommodityModel.findOneAndUpdate query, {$set : commodity}, (err, doc) ->
            if err
              return cbf err, null
            else
              return cbf null, doc

        # 不存在， 则新增
        else
          commodity.save (err, doc) ->
            return cbf err, null if err
            return cbf null, doc

  # 查询商品
  findCommodity : (params, cbf) ->
    CommodityModel.find params, (err, docs) ->
      if err
        return cbf err, null
      else
        return cbf null, docs

  # 删除商品
  deleteCommodity : (params, cbf) ->
    CommodityModel.remove params, (err, doc) ->
      if err
        return cbf err, null
      else
        return cbf null, doc

module.exports = CommodityServices