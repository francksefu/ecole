class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(name: params[:student][:name], first_name: params[:student][:first_name],
                           phone: params[:student][:phone], user: User.first)
    respond_to do |format|
      format.html do
        if @student.save
          @student.create_associate_user
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
    params.require(:student).permit(:name, :first_name, :phone)
  end
end
