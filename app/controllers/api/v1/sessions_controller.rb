class Api::V1::SessionsController < ApiController
  def create
    user = User.find_by_email(session_params[:email])
    stored_pw = BCrypt::Password.new(user.password)

    if stored_pw == session_params[:password]
      @session = user.sessions.create(token: SecureRandom.hex(16), ttl: 900)
      render json: {token: @session.token}
    else
      render json: @session, status: :unauthorized
    end

  end

  def destroy
    render json: {status: "LOGGED OUT"}
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
