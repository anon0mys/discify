class Api::V1::CoursesController < ApiController
  def index
    @courses = Course.filter(filtering_params)
    render json: @courses, include: ''
  end

  def show
    @course = Course.find(params[:id])
    render json: @course, include: '**'
  end

  private

  def filtering_params
    params.slice(:name, :city, :state, :rating_min, :holes_min)
  end
end