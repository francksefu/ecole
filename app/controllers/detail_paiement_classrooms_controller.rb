class DetailPaiementClassroomsController < ApplicationController

  def new
    @detail_paiement = DetailPaiement.find(params[:detail_paiement_id].to_i)
    @detail_paiement_classroom = DetailPaiementClassroom.new
    @classrooms = Classroom.all
    @year = Year.find(params[:year_id].to_i)
  end

  def create
    @year = Year.find(params[:year_id].to_i)
    @detail_paiement = DetailPaiement.find(params[:detail_paiement_id].to_i)
    @detail_paiement_classroom = @detail_paiement.detail_paiement_classrooms.new(detail_paie_params)
    if @detail_paiement_classroom.save
      flash[:success] = 'paiement for this classroom save successfully'
      redirect_to year_detail_paiement_path(@year, @detail_paiement)
    else
      flash[:error] = 'Error : detail of paiement didn t save'
      render :new, locals: {detail_paiement_classroom: @detail_paiement_classroom}
    end
  end

  def classroom_paiement
    @total = 0
    @classroom = Classroom.find(params[:classroom_id].to_i)
    @detail_paiement_classrooms = @classroom.detail_paiement_classrooms
  end

  def detail_paie_params
    params.require(:detail_paiement_classroom).permit(:classroom_id)
  end

end
