class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ApiResponse
  include RackSessionFix
  before_action :authenticate_user!
end
