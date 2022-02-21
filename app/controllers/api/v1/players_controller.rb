class Api::V1::PlayersController < ApiController
  def index
    @players = Player.all
    render json: @players
  end

  def show
    @player = Player.find(params[:id])
    render json: @player
  end

  def create
    @player = Player.create!(player_params)
    render json: @player, status: :created
  end

  def destroy
    Player.find(params[:id]).destroy
    head :accepted
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end