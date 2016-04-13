express = require "express"
router = express.Router()

router.get "/", (req, res, next) ->
  res.render "index", {"title": "coffee-script"}

router.get "/test", (req, res, next) ->
  res.render "index", {"title": "node-dev add succ!"}

router.get "/new", (req, res, next) ->
  res.render "index", {"title": "new" }

router.get "/ssh", (req, res, next) ->
  res.render "index", {"title": "ssh" }

module.exports = router