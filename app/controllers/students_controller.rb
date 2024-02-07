class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @parents = Parent.all
    @student = Student.new
  end

  def create
    @student = User.first.student.new(student_params)
    respond_to do |format|
      format.html do
        if @student.save
          @student.create_associate_user('student')
          flash[:success] = 'student saved successfully'
          redirect_to students_path
        else
          flash.now[:error] = "Error : student didn't save"
          render :new, locals: { student: @student }
        end
      end
    end
  end

  def student_params
    params.require(:student).permit(:parent_id, :name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
