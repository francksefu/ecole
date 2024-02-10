class ClassroomTeachersController < ApplicationController

  def index
    @classroom = Classroom.find_by(id: params[:classroom_id])
    @years = Year.all.order(name: :desc)
    @course_teachers = CourseTeacher.all
  end
end