class StudiesDirectorsController < ApplicationController
  def index
    @studies_directors = StudiesDirector.all
  end

  def new
    @studies_director = StudiesDirector.new
  end

  def create
    @studies_director = User.first.studies_director.new(studies_director_params)
    respond_to do |format|
      format.html do
        if @studies_director.save
          @studies_director.create_associate_user('studies_director')
          flash[:success] = 'studies_director saved successfully'
          redirect_to studies_directors_path
        else
          flash.now[:error] = "Error : studies_director didn't save"
          render :new, locals: { studies_director: @studies_director }
        end
      end
    end
  end

  def studies_director_params
    params.require(:studies_director).permit(:name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
