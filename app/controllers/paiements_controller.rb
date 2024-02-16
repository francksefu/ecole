class PaiementsController < ApplicationController

  def new
    @detail_paiement_classroom = DetailPaiementClassroom.find(params[:detail_paiement_classroom_id].to_i)
    @classroom = @detail_paiement_classroom.classroom
    @promotions = @classroom.promotions
    @accountant = Accountant.find(params[:accountant_id].to_i)
    @paiement = Paiement.new
  end

  def create
    @promotion = Promotion.find(params[:paiement][:promotion_id].to_i)
    @student = @promotion.student
    @accountant = Accountant.find(params[:accountant_id].to_i)
    @detail_paiement_classroom = DetailPaiementClassroom.find(params[:detail_paiement_classroom_id].to_i)
    @paiement = @accountant.paiements.new(student: @student, detail_paiement_classroom: @detail_paiement_classroom, montant: params[:paiement][:montant])
    if @paiement.save
      flash[:success] = 'Paiement save successfully'
      redirect_to
    else
      flash.now[:error] = 'Error : Paiement didn t save'
      render :new. locals{paiement: @paiement}
    end
  end
end
