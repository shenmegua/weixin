router = (app) ->
  app.get "/", (req, res, next) ->
    res.render "index", {"title": "coffee-script"}

module.exports = router