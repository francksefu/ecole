class PeriodesController < ApplicationController
  def index
    @periodes = Periode.all
  end

  def new
    @periode = Periode.new
    @year = Year.find_by(id: params[:year_id].to_i)
  end

  def create
    @year = Year.find_by(id: params[:year_id].to_i)
    @periode = @year.periodes.new(periode_params)
    if @periode.save
      flash[:success] = 'Periode saved successfully'
      redirect_to @year
    else
      flash[:error] = 'Error: Period didn t be save '
      render :new, locals: { periode: @periode }
    end
  end

  private

  def periode_params
    params.require(:periode).permit(:name, :start_date, :end_date)
  end
end
