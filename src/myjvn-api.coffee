xml2js = require 'xml2js'
parser = new xml2js.Parser()

class MyjvnAPI

    @getVendorList: (params = {}) ->
        params['method'] = 'getVendorList'
        @request 'GET', '/myjvn', params

    @getProductList: (params = {}) ->
        params['method'] = 'getProductList'
        @request 'GET', '/myjvn', params

    @getVulnOverviewList: (params = {}) ->
        params['method'] = 'getVulnOverviewList'
        @request 'GET', '/myjvn', params

    @getVulnDetailInfo: (params = {}) ->
        params['method'] = 'getVulnDetailInfo'
        @request 'GET', '/myjvn', params

    @getStatistics: (params = {}) ->
        params['method'] = 'getStatistics'
        @request 'GET', '/myjvn', params

    @getOvalList: (params = {}) ->
        params['method'] = 'getOvalList'
        @request 'GET', '/myjvn', params

    @getOvalData: (params = {}) ->
        params['method'] = 'getOvalData'
        @request 'GET', '/myjvn', params

    @getXccdfList: (params = {}) ->
        params['method'] = 'getXccdfList'
        @request 'GET', '/myjvn', params

    @getXccdfData: (params = {}) ->
        params['method'] = 'getXccdfData'
        @request 'GET', '/myjvn', params

    @getCPEDictionary: (params = {}) ->
        params['method'] = 'getCPEDictionary'
        @request 'GET', '/myjvn', params

    @request: (method, endpoint, params) ->
        query = (k + '=' + v for k, v of params).join('&')
        url = "http://jvndb.jvn.jp#{endpoint}?#{query}"
        fetch url,
            method: method
            mode: 'no-cors'
            headers:
              'Content-Type': 'application/xml'
              Accept: 'application/xml'
        .then _checkStatus
        .then _parseJSON

    _checkStatus = (response) ->
        if 200 <= response.status and response.status < 300
            response.text()
        else
            error = new Error response.statusText
            error.response = response
            throw error

    _parseJSON = (xml) ->
        new Promise (resolve, reject) ->
            parser.parseString xml, (err, result) ->
                if err then reject err else resolve result

module.exports = MyjvnAPI