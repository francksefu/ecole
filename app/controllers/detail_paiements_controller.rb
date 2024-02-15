class DetailPaiementsController < ApplicationController

  def show
    @detail_paiement = DetailPaiement.find(params[:id].to_i)
    @year = Year.find(params[:year_id].to_i)
    @detail_paiement_classrooms = @detail_paiement.detail_paiement_classrooms
  end

  def index
    @year = Year.find(params[:year_id].to_i)
    @detail_paiements = @year.detail_paiements
  end

  def new
    @detail_paiement = DetailPaiement.new
  end

  def create
    @year = Year.find(params[:year_id].to_i)
    @detail_paiement = @year.detail_paiements.new(detail_paiement_params)
    if @detail_paiement.save
      flash[:success] = 'This details of paiement, save successfully'
      redirect_to year_detail_paiements_path(@year)
    else
      flash.now[:error] = 'Error: detail didn t save'
      render :new, locals: {detail_paiement: @detail_paiement}
    end
  end

  def detail_paiement_params
    params.require(:detail_paiement).permit(:frais_name, :montant, :description)
  end
end
