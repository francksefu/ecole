class PromotionsController < ApplicationController
  def index
    @teacher = Teacher.find_by(id: params[:teacher_id].to_i)
    @course_teacher = CourseTeacher.find_by(id: params[:course_teacher_id].to_i)
    @periode = Periode.find_by(id: params[:periode_id].to_i)
    @classroom = @course_teacher.classroom_course.classroom
    @year = @course_teacher.year
    @promotions = Promotion.where(classroom: @classroom, year: @year)
    @date_evaluations = DateEvaluation.where(classroom_course: @course_teacher.classroom_course, periode: @periode)
  end

  def new
    @student = Student.find_by(id: params[:student_id].to_i)
    @years = Year.all
    @classrooms = Classroom.all
    @promotion = Promotion.new
  end

  def create
    @student = Student.find_by(id: params[:student_id].to_i)
    @promotion = @student.promotions.new(promotion_params)
    if @promotion.save
      flash[:success] = 'Course save in classroom successfully'
      redirect_to @student
    else
      flash[:error] = 'Error, something went wrong, course didn t save'
      render :new, locals: { promotion: @promotion }
    end
  end

  def promotion_params
    params.require(:promotion).permit(:year_id, :classroom_id)
  end
end
