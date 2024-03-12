class GiveWorksController < ApplicationController
  def show
    @give_work = GiveWWork.find(params[:give_work_id].to_i)
  end

  def student_work
    @classroom = Classroom.find(params[:classroom_id].to_i)
    @course = Course.find(params[:course_id].to_i)
    @promotion = Promotion.find(params[:promotion_id].to_i)
    @year = @promotion.year
    @classroom_course = ClassroomCourse.where(classroom: @classroom, course: @course).first
    @date_evaluations = DateEvaluation.where(is_remote: true, classroom_course_id: @classroom_course.id)
  end

  def index
    @teacher = Teacher.find(params[:teacher_id].to_i)
    @course_teacher = CourseTeacher.find(params[:course_teacher_id].to_i)
    @periode = Periode.find(params[:periode_id].to_i)
    @date_evaluation = DateEvaluation.find(params[:date_evaluation_id])
  end

  def new
    @give_work = GiveWork.new
    @date_evaluation = DateEvaluation.find(params[:date_evaluation_id].to_i)
  end

  def create
    @date_evaluation = DateEvaluation.find(params[:date_evaluation_id].to_i)
    @give_work = @date_evaluation.give_works.new(give_work_params)
    @teacher = Teacher.find(params[:teacher_id].to_i)
    @course_teacher = CourseTeacher.find(params[:course_teacher_id].to_i)
    @periode = Periode.find(params[:periode_id].to_i)
    respond_to do |format|
      format.html do
        if @give_work.save
          flash[:success] = 'work created successfully'
          redirect_to teacher_course_teacher_periode_date_evaluation_give_works_path(@teacher, @course_teacher, @periode, @date_evaluation)
        else
          flash.now[:error] = "Error : work didn't save"
          render :new, locals: { give_work: @give_work }
        end
      end
    end
  end

  def give_work_params
    params.require(:give_work).permit(:render_time, images: [])
  end
end
