class Api::V1::RoundsController < ApiController
  def create
    @round = Round.create!(round_params)
    create_player_rounds
    render json: @round, status: 201
  end

  private

  def create_player_rounds
    params.slice(:player_ids).each do |player_id|
      @round.player_rounds.create!(player_id: player_id, score: 0)
    end
  end

  def round_params
    params.require(:round).permit(:course_id, :layout_id)
  end
end