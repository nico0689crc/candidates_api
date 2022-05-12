class ApiController < ActionController::API
  # include TokenUserPermission
  # include ApiExceptionHandler
  include DeviseTokenAuth::Concerns::SetUserByToken
  include RackSessionFix
  include ApiResponse
  before_action :authenticate_user!
end
