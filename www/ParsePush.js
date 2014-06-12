var exec = require('cordova/exec');

var ParsePush = {
  sendNotification: function(data, successCallback, failCallback) {
    exec(successCallback, failCallback, 'ParsePush', 'sendNotification', [data]);
  },
  getNotification: function(data, successCallback, failCallback) {
    exec(successCallback, failCallback, 'ParsePush', 'getNotification', [data]);
  }
}

module.exports = ParsePush;
