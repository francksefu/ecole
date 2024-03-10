class ClassroomCoursesController < ApplicationController
  def index
    @classroom_courses = ClassroomCourse.all
  end

  def new
    @courses = Course.all
    @classroom_course = ClassroomCourse.new
  end

  def create
    @classroom = Classroom.find_by(id: params[:classroom_id].to_i)
    @classroom_course = @classroom.classroom_courses.new(classroom_course_params)
    if @classroom_course.save
      flash[:success] = 'Course save in classroom successfully'
      redirect_to @classroom
    else
      flash[:error] = 'Error, something went wrong, course didn t save'
      render :new, locals: { classroom_course: @classroom_course }
    end
  end

  def classroom_course_params
    params.require(:classroom_course).permit(:course_id)
  end
end
