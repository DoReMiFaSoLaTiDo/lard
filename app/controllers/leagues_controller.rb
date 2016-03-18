class LeaguesController < ApplicationController
  before_filter :intercept_html_requests
  layout false
  respond_to :json
  before_action :set_league, only: [:show, :edit, :update, :destroy]

  # GET /leagues
  # GET /leages.json
  def index
    @leagues = League.all
    render json: @leagues
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    render json: @league
  end

  def create
    @league = League.new(league_params)

    if @league.save
      render json: @league, status: :created
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    if @league.update(league_params)
      head :no_content
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def delete
    @league.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find_by(:id, params[:id])
    end

    def league_params
      param.require(:league).permit(:league_name, :country)
    end

    # if someone asks for html, redirect them to the home page, we only serve json
    def intercept_html_requests
      redirect_to('/') if request.format == Mime::HTML
    end
end
