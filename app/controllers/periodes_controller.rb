class PeriodesController < ApplicationController
  
  def index
    @periodes = Periode.all
  end

  def new
    @years = Year.all
    @periode = Periode.new
  end

  def create
    @periode = Periode.new(periode_params)
    if @periode.save
      flash[:success] = 'Periode saved successfully'
      redirect_to periodes_path
    else
      flash[:error] = 'Error: Period didn t be save '
      render :new, locals: {periode: @periode}
    end
  end

  private

  def periode_params
    params.require(:periode).permit(:name, :start_date, :end_date, :year_id)
  end
end