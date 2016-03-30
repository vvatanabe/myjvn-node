require 'isomorphic-fetch'
assert = require 'power-assert'
promise = require 'es6-promise'
promise.polyfill()

describe "main", ->

  if global.mocha
    global.mocha.globals ['*']

  beforeEach (done) ->
    global.Myjvn = require '../src/main'
    done()

  it "can be request.", (done) ->
    @timeout 20000
    Myjvn.API
      .request 'GET', '/myjvn', 'method': 'getVendorList'
      .then (data) ->
        assert data
        done()

  it "can not be request.", (done) ->
    @timeout 20000
    Myjvn.API
      .request 'GET', '/yourjvn', {}
      .catch (err) ->
        assert err
        done()

  it "can be get vendor list.", (done) ->
    @timeout 20000
    Myjvn.API
      .getVendorList()
      .then (data) ->
        assert data
        done()

  it "can be get product list.", (done) ->
    @timeout 20000
    Myjvn.API
      .getProductList()
      .then (data) ->
        assert data
        done()

  it "can be get vuln overview list.", (done) ->
    @timeout 20000
    Myjvn.API
      .getVulnOverviewList()
      .then (data) ->
        assert data
        done()

  it "can be get vuln detail info.", (done) ->
    @timeout 20000
    Myjvn.API
      .getVulnDetailInfo()
      .then (data) ->
        assert data
        done()

  it "can be get statistics.", (done) ->
    @timeout 20000
    Myjvn.API
      .getStatistics()
      .then (data) ->
        assert data
        done()

  it "can be get oval list.", (done) ->
    @timeout 20000
    Myjvn.API
      .getOvalList()
      .then (data) ->
        assert data
        done()

  it "can be get oval data.", (done) ->
    @timeout 20000
    Myjvn.API
      .getOvalData()
      .then (data) ->
        assert data
        done()

  it "can be get xccdf list.", (done) ->
    @timeout 20000
    Myjvn.API
      .getXccdfList()
      .then (data) ->
        assert data
        done()

  it "can be get xccdf data.", (done) ->
    @timeout 20000
    Myjvn.API
      .getXccdfData()
      .then (data) ->
        assert data
        done()

  it "can be get CPEDictionary.", (done) ->
    @timeout 20000
    Myjvn.API
      .getCPEDictionary()
      .then (data) ->
        assert data
        done()
