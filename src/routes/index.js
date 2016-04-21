// Generated by CoffeeScript 1.10.0
(function() {
  var UserCtrls, router;

  UserCtrls = require('../ctrls/user_ctrl');

  router = function(app) {
    app.get("/", function(req, res, next) {
      if (req.session.sign) {
        return res.render("home", {
          session: req.session
        });
      } else {
        return res.render("index", {
          "title": "index"
        });
      }
    });
    app.get("/reg", function(req, res) {
      return res.render("reg/register", {
        "title": "用户注册"
      });
    });
    app.post("/reg", function(req, res) {
      return UserCtrls.save(req, res, function(err, user) {
        if (err) {
          return res.redirect(404);
        } else {
          return res.render('index', {
            "title": "Index"
          });
        }
      });
    });
    app.get("/login", function(req, res) {
      return res.render("login/login", {
        "title": "Login"
      });
    });
    app.post("/login", function(req, res) {
      return UserCtrls.find_user(req, res, function(err, user) {
        if (err) {
          return res.redirect(404);
        } else {
          if (!user) {
            req.flash('error', '登录失败！');
            return res.render('/');
          } else {
            req.session.sign = true;
            req.session.user = user;
            req.flash('success', '登录成功！');
            return res.render("home", {
              session: req.session
            });
          }
        }
      });
    });
    return app.get("/logout", function(req, res) {
      req.session.destroy();
      return res.redirect("/");
    });
  };

  module.exports = router;

}).call(this);
