// Generated by CoffeeScript 1.10.0
(function() {
  var UserCtrls, router;

  UserCtrls = require('../ctrls/user_ctrl');

  router = function(app) {
    return app.get("/", function(req, res, next) {
      return UserCtrls.find_user(req, res, function(err, doc) {
        if (err) {
          console.log('err', err);
        } else {

        }
        return res.render("index", {
          "title": doc
        });
      });
    });
  };

  module.exports = router;

}).call(this);
