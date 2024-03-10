class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all.order(name: :asc)
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = User.first.teachers.new(teacher_params)
    respond_to do |format|
      format.html do
        if @teacher.save
          @teacher.create_associate_user('teacher')
          flash[:success] = 'teacher saved successfully'
          redirect_to teachers_path
        else
          flash.now[:error] = "Error : teacher didn't save"
          render :new, locals: { teacher: @teacher }
        end
      end
    end
  end

  def show
    @teacher = Teacher.find(params[:id].to_i)
    @years = Year.all.order(name: :desc)
    @course_teachers = CourseTeacher.where(teacher: @teacher)
  end

  def teacher_params
    params.require(:teacher).permit(:name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
