class RenderWorksController < ApplicationController
  def index
    @promotion = Promotion.find(params[:promotion_id].to_i)
    @give_work = GiveWork.find(params[:give_work_id].to_i)
    @date_evaluation = @give_work.date_evaluation

  end

  def new
    @render_work = RenderWork.new
    @give_work = GiveWork.find(params[:give_work_id].to_i)
    @promotion = Promotion.find(params[:promotion_id].to_i)
  end

  def create
    @give_work = GiveWork.find(params[:give_work_id].to_i)
    @promotion = Promotion.find(params[:promotion_id].to_i)
    @render_work = RenderWork.new(promotion: @promotion, give_work: @give_work, images: params[:render_work][:images])
    respond_to do |format|
      format.html do
        if @render_work.save
          flash[:success] = 'work created successfully'
          redirect_to root_path
        else
          flash.now[:error] = "Error : work didn't save"
          render :new, locals: { render_work: @render_work }
        end
      end
    end
  end

  def render_work_params
    params.require(:render_work).permit( images: [])
  end
end
