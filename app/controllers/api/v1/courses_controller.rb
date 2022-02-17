class Api::V1::CoursesController < ApiController
  def index
    render json: [
      {id: 1, name: 'Test Course'}
    ]
  end
end