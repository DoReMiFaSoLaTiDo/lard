require 'auth_token'

class SessionTokensController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    token = AuthToken.encode('user_id' => current_user.id)

    respond_to do |format|
      format.json { render json: {'token' => token}, status: :created }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: {'logged_in' => true} }
    end
  end
end
