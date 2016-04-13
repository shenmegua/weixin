UserCtrls = require '../ctrls/user_ctrl'
router = (app) ->
  app.get "/", (req, res, next) ->
    UserCtrls.find_user req, res, (err, doc) ->
      if err
        console.log 'err', err
      else
      res.render "index", {"title": doc}

module.exports = router