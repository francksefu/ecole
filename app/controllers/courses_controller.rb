class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      format.html do
        if @course.save
          flash[:success] = 'course saved successfully'
          redirect_to courses_path
        else
          flash.now[:error] = "Error : course didn't save"
          render :new, locals: { course: @course }
        end
      end
    end
  end

  def course_params
    params.require(:course).permit(:name, :credit, :description)
  end
end
