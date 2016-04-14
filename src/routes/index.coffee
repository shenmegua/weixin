UserCtrls = require '../ctrls/user_ctrl'
router = (app) ->
  app.get "/", (req, res, next) ->
    if req.session.sign
      res.render "home", {session: req.session}
    else
      res.render "index", {"title": "index"}
    # UserCtrls.find_user req, res, (err, doc) ->
    #   if err
    #     res.redirect 404
    #   else
    #     res.render "index", {"title": "Expres", "user": "htd"}

  # 跳转到注册用户界面
  app.get "/reg", (req, res) ->
    res.render "reg/register", {"title": "用户注册"}

  # 用户注册
  app.post "/reg", (req, res) ->
    UserCtrls.save req, res, (err, user) ->
      if err
        res.redirect 404
      else
        res.render 'index', {"title": "Index"}

  # 跳转到用户登录界面
  app.get "/login", (req, res) ->
    res.render "login/login", {"title": "Login"}

  #用户登录
  app.post "/login", (req, res) ->
    UserCtrls.find_user req, res, (err, user) ->
      if err
        res.redirect 404
      else
        if !user
          console.log '用户不存在'
          res.render 'login/login'
        else
          req.session.sign = true
          req.session.user = user
          console.log 'name', req.session
          res.render "home", {session: req.session}

  app.get "/logout", (req, res) ->
    req.session.destroy()
    res.redirect "/"

module.exports = router