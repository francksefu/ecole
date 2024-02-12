class DateEvaluationsController < ApplicationController

  def new
    @periode = Periode.find_by(id: params[:periode_id].to_i)
    @course_teacher = CourseTeacher.find_by(id: params[:course_teacher_id].to_i)
    @classroom_course = @course_teacher.classroom_course
    @date_evaluation = DateEvaluation.new
  end

  def create
    @periode = Periode.find_by(id: params[:periode_id].to_i)
    @course_teacher = CourseTeacher.find_by(id: params[:course_teacher_id].to_i)
    @teacher = @course_teacher.teacher
    @classroom_course = @course_teacher.classroom_course
    @date_evaluation = DateEvaluation.new(periode: @periode, classroom_course: @classroom_course, date: params[:date_evaluation][:date], maximum: params[:date_evaluation][:maximum])
    if @date_evaluation.save
      flash[:success] = 'Date of evaluation save successfully'
      redirect_to teacher_course_teacher_periode_promotions_path(@teacher, @course_teacher, @periode)
    else
      flash.now[:error] = 'Error, date of evaluation didn t save'
      render :new, locals: {date_evaluation: @date_evaluation}
    end
  end
end