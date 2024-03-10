class DisciplineDirectorsController < ApplicationController
  def index
    @discipline_directors = DisciplineDirector.all
  end

  def new
    @discipline_director = DisciplineDirector.new
  end

  def show
    @discipline_director = DisciplineDirector.find(params[:id].to_i)
    @sections = Section.all.includes(:classrooms)
    @year = Year.last
  end

  def create
    @discipline_director = User.first.discipline_directors.new(discipline_director_params)
    respond_to do |format|
      format.html do
        if @discipline_director.save
          @discipline_director.create_associate_user('discipline_director')
          flash[:success] = 'discipline_director saved successfully'
          redirect_to discipline_directors_path
        else
          flash.now[:error] = "Error : discipline_director didn't save"
          render :new, locals: { discipline_director: @discipline_director }
        end
      end
    end
  end

  def discipline_director_params
    params.require(:discipline_director).permit(:name, :first_name, :last_name, :date_of_birth, :phone)
  end
end
