class Api::V1::RoundsController < ApiController
  before_action :create_manager

  def create
    @round_manager.start_round(round_params)
    render json: @round_manager.round, status: :created
  end

  def show
    @round = Round.find(params[:id])
    render json: @round
  end

  def end_round
    @round_manager.find_round(params[:round_id]).end_round(player_score_params)
    render json: @round_manager.round
  end
  
  def score_hole
    @round_manager.find_round(params[:round_id]).score_hole(hole_score_params)
    render json: @round_manager.round,
           serializer: RoundHoleSerializer,
           hole_number: hole_score_params[:hole_number].to_i
  end

  private

  def create_manager
    @round_manager = RoundManager.new
  end

  def player_score_params
    params.fetch(:round, {})
          .permit(player_scores: [:player_id, :total_score])
          .to_h
          .symbolize_keys
  end

  def hole_score_params
    params.require(:hole)
          .permit(:hole_number, player_scores: [:player_id, :strokes])
          .to_h
          .symbolize_keys
  end

  def round_params
    params.require(:round)
          .permit(:course_id, :layout_id, player_ids: [])
          .to_h
          .symbolize_keys
  end
end