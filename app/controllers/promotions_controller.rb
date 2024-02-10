class PromotionsController < ApplicationController
    def index
      @promotions = Promotion.all
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
        render :new, locals: {promotion: @promotion}
      end
    end
  
    def promotion_params
      params.require(:promotion).permit(:year_id, :classroom_id)
    end
  end