class AccountantsController < ApplicationController

  def show
    @accountant = Accountant.find(params[:id].to_i)
    @paiements = @accountant.paiements
  end

  def index
    @accountants = Accountant.all
  end

  def new
    @accountant = Accountant.new
  end

  def create
    @accountant = User.first.accountant.new(accountant_params)
    respond_to do |format|
      format.html do
        if @accountant.save
          @accountant.create_associate_user('accountant')
          flash[:success] = 'accountant saved successfully'
          redirect_to accountants_path
        else
          flash.now[:error] = "Error : accountant didn't save"
          render :new, locals: { accountant: @accountant }
        end
      end
    end
  end

  def accountant_params
    params.require(:accountant).permit(:name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
