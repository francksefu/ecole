class PaiementsController < ApplicationController

  def index
    @classroom = Classroom.find(params[:classroom_id].to_i)
    @year = Year.find(params[:year_id].to_i)
    @student = Student.find(params[:student_id].to_i)
    @detail_paiement_classrooms = @classroom.detail_paiement_classrooms
    @total = 0
    @total_paie = 0
  end

  def choose_paiement
    @accountant = Accountant.find(params[:id].to_i)
    @sections = Section.all.includes(:classrooms)
    @years = Year.all.order(created_at: :desc)
  end

  def new
    @detail_paiement_classroom = DetailPaiementClassroom.find(params[:detail_paiement_classroom_id].to_i)
    @student = Student.find(params[:student_id].to_i)
    @accountant = Accountant.first
    @paiement = Paiement.new
  end

  def create
    @accountant = Accountant.first
    @student = Student.find(params[:student_id].to_i)
    @detail_paiement_classroom = DetailPaiementClassroom.find(params[:detail_paiement_classroom_id].to_i)
    @paiement = @accountant.paiements.new(student: @student, detail_paiement_classroom: @detail_paiement_classroom, montant: params[:paiement][:montant])
    if @paiement.save
      flash[:success] = 'Paiement save successfully'
      redirect_to student_classroom_year_paiements_path(@student, @detail_paiement_classroom.classroom, @detail_paiement_classroom.detail_paiement.year)
    else
      flash.now[:error] = 'Error : Paiement didn t save'
      render :new, locals: {paiement: @paiement}
    end
  end
end
