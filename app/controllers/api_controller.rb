class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_headers

  def set_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Request-With, Content-Type, Accept, Authorization'
  end

  def current_user
    session = Session.find_by_token(request.headers['Authorization'])

    session && session.is_valid? ? session.user : nil
  end

end
