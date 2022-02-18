class Api::V1::CoursesController < ApiController
  def index
    @courses = Course.filter(filtering_params)
    render json: {courses: @courses}
  end

  private

  def filtering_params
    params.slice(:name, :city, :state, :rating_min, :holes_min)
  end
end