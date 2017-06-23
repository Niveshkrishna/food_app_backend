class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :set_cross_origin_header
    def set_cross_origin_header
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE'
        response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
        response.headers['Access-Control-Max-Age'] = '1728000'
    end
end
