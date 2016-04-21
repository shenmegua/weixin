CartsService = require '../service/carts_service'

module.exports.save = (req, res, cbf) ->
  params = {}
  params.uId = req.body?.uId or req.params?.uId or req.query?.uId or ''
  params.cId = req.body?.cId or req.params?.cId or req.query?cId or ''
  params.cName = req.body?.cName or req.params?.cName or req.query?.cName or ''
  params.cPrice = req.body?.cPrice or req.params?.cPrice or req.query?.cPrice or ''
  params.cImgId = req.body?.cImgId or req.params?.cImgId or req.query?.cImgId or ''
  params.cQuantity = req.body?.cQuantity or req.params?.cQuantity or req.query?.cQuantity or ''
  params.cStatus = req.body?.cStatus or req.params?.cStatus or req.query?.cStatus or ''

  CartsService.addCarts params, cbf

module.exports.find = (req, res, cbf) ->
  params = {}
  CartsService.findCarts params, cbf  

module.exports.remove = (req, res, cbf) ->
  params = {}
  params._id = req.body?._id or req.query?._id or req.params?._id
  CartsService.deleteCarts params, cbf