require('es6-promise').polyfill()
require('isomorphic-fetch')
Myjvn = require('../dist/myjvn')

Myjvn.API
    .getVulnOverviewList({})
    .then(function(data) {
        console.log(data);
    })
    .catch(function(err) {
        console.log(err);
    });