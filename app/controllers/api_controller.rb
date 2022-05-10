class ApiController < ActionController::API
  # include TokenUserPermission
  include ApiExceptionHandler
  include ApiResponse
  # before_action :authorize_user!
end
