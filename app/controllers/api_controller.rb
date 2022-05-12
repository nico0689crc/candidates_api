class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ApiResponse
  before_action :authenticate_user!
end
