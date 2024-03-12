class CourseTeachersController < ApplicationController
  def new
    @course_teacher = CourseTeacher.new
    @years = Year.all
    @classroom_courses = ClassroomCourse.all
  end

  def create
    @teacher = Teacher.find_by(id: params[:teacher_id].to_i)
    @course_teacher = @teacher.course_teachers.new(course_teacher_params)
    if @course_teacher.save
      flash[:success] = 'Course for teacher save'
      redirect_to @teacher
    else
      render :new, locals: { course_teacher: @course_teacher }
    end
  end

  def course_teacher_params
    params.require(:course_teacher).permit(:year_id, :classroom_course_id)
  end
end
