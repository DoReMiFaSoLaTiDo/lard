class AuthController < ApplicationController
  def authenticate
    # You'll need to implement the below method. It should return the
    # user instance if the username and password are valid.
    # Otherwise return nil.
    user = User.find_by_credentials(params[:username], params[:password])
    if user
      render json: authentication_payload(user) #{ auth_token: user.generate_auth_token } # authentication_payload(user)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  def register
    user = User.new(user_params)
    if user.save
      token = AuthToken.issue_token({ user_id: user.id })
      render json: { user: user,
                   token: token }
      else
        render json: { errors: user.errors }
      end
    end


  private

  def authentication_payload(user)
    return nil unless user && user.id
    {
      auth_token: AuthToken.encode({ user_id: id }),
      user: { id: user.id, username: user.username } # return whatever user info you need
    }
  end
end
