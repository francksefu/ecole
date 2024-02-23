class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def student_promotions

    @accountant = Accountant.find(params[:accountant_id].to_i)
    convert_id = params[:student][:student_id].to_i
    @student = Student.find(convert_id)
    @promotions = @student.promotions
    #redirect_to accountant_student_promotions_path
  end
  def show
    @student = Student.find_by(id: params[:id])
    @years = Year.all.order(name: :desc)
    @promotions = @student.promotions
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
