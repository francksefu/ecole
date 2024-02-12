class EvaluatesController < ApplicationController

  def new
    @periode = Periode.find_by(id: params[:periode_id].to_i)
    @course_teacher = CourseTeacher.find_by(id: params[:course_teacher_id].to_i)
    @teacher = @course_teacher.teacher
    @promotion = Promotion.find_by(id: params[:promotion_id].to_i)
    
    @date_evaluation = DateEvaluation.find_by(id: params[:date_evaluation_id])
    @evaluate = Evaluate.new
  end

  def create
    @periode = Periode.find_by(id: params[:periode_id].to_i)
    @course_teacher = CourseTeacher.find_by(id: params[:course_teacher_id].to_i)
    @teacher = @course_teacher.teacher

    @date_evaluation = DateEvaluation.find_by(id: params[:date_evaluation_id].to_i)
    @promotion = Promotion.find_by(id: params[:promotion_id].to_i)
    @evaluate = @date_evaluation.evaluates.new(point: params[:evaluate][:point], promotion: @promotion)
    if @evaluate.save
      flash[:success] = 'Evaluation create successfully'
      redirect_to teacher_course_teacher_periode_promotions_path(@teacher, @course_teacher, @periode)
    else
      flash.now[:error] = 'Error: Evaluation for this student didn t save'
      render :new, locals: [evaluate: @evaluate]
    end
  end

  def evaluate_params
    
  end
end