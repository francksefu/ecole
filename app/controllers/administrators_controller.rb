class AdministratorsController < ApplicationController
  def index
    @administrators = Administrator.all
  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = User.first.administrators.new(administrator_params)
    respond_to do |format|
      format.html do
        if @administrator.save
          @administrator.create_associate_user('administrator')
          flash[:success] = 'administrator saved successfully'
          redirect_to administrators_path
        else
          flash.now[:error] = "Error : administrator didn't save"
          render :new, locals: { administrator: @administrator }
        end
      end
    end
  end

  def administrator_params
    params.require(:administrator).permit(:name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
