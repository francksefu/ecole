class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = User.first.teacher.new(teacher_params)
    respond_to do |format|
      format.html do
        if @teacher.save
          @teacher.create_associate_user
          flash[:success] = 'teacher saved successfully'
          redirect_to teachers_path
        else
          flash.now[:error] = "Error : teacher didn't save"
          render :new, locals: { teacher: @teacher }
        end
      end
    end
  end

  def teacher_params
    params.require(:teacher).permit(:name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
