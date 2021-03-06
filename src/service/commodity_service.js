// Generated by CoffeeScript 1.10.0
(function() {
  var CommodityModel, CommodityServices;

  CommodityModel = require('../model/commodity_model');

  CommodityServices = {
    addCommodity: function(params, cbf) {
      var commodity, query;
      commodity = new CommodityModel(params);
      query = {
        _id: params._id
      };
      return CommodityModel.findOne(query, function(err, doc) {
        if (err) {
          return cbf(err, null);
        } else {
          if (doc && doc.length > 0) {
            return CommodityModel.findOneAndUpdate(query, {
              $set: commodity
            }, function(err, doc) {
              if (err) {
                return cbf(err, null);
              } else {
                return cbf(null, doc);
              }
            });
          } else {
            return commodity.save(function(err, doc) {
              if (err) {
                return cbf(err, null);
              }
              return cbf(null, doc);
            });
          }
        }
      });
    },
    findCommodity: function(params, cbf) {
      return CommodityModel.find(params, function(err, docs) {
        if (err) {
          return cbf(err, null);
        } else {
          return cbf(null, docs);
        }
      });
    },
    deleteCommodity: function(params, cbf) {
      return CommodityModel.remove(params, function(err, doc) {
        if (err) {
          return cbf(err, null);
        } else {
          return cbf(null, doc);
        }
      });
    }
  };

  module.exports = CommodityServices;

}).call(this);
