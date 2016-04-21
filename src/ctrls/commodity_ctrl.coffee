CommodityService = require '../service/commodity_service'

module.exports.save = (req, res, cbf) ->
  params = {}
  params.name = req.body?.name or req.params?.name or req.body?.name
  params.price = req.body?.price or req.params?.price or req.body?.price
  params.imgSrc = req.body?.imgSrc or req.params?.imgSrc or req.body?.imgSrc
  CommodityService.addCommodity params, cbf

module.exports.find = (req, res, cbf) ->
  params = {}

  CommodityService.findCommodity params, cbf

module.exports.remove = (req, res, cbf) ->
  params = {}
  params._id = req.body?._id or req.params?._id or req.body?._id
  CommodityService.deleteCommodity params, cbf