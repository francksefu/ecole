class ObservationDisciplinariesController < ApplicationController

  def index
    @classroom = Classroom.find(params[:classroom_id].to_i)
    @discipline_director = DisciplineDirector.find(params[:discipline_director_id].to_i)
    @year = Year.find(params[:year_id].to_i)
    @observation_disciplinaries = ObservationDisciplinary.where(discipline_director_id: @discipline_director.id)
  end

  def new
    @classroom = Classroom.find(params[:classroom_id])
    @promotions = @classroom.promotions
    @discipline_director = DisciplineDirector.find(params[:discipline_director_id])
    @observation_disciplinary = ObservationDisciplinary.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @promotions = @classroom.promotions
    @year = Year.find(params[:year_id].to_i)
    @discipline_director = DisciplineDirector.find(params[:discipline_director_id])
    @observation_disciplinary = ObservationDisciplinary.new(discipline_director_id: @discipline_director.id, date: params[:observation_disciplinary][:date], observation: params[:observation_disciplinary][:observation], promotion_id: params[:observation_disciplinary][:promotion_id])    
    if @observation_disciplinary.save
      flash[:success] = 'Observation created successfully'
      redirect_to  discipline_director_year_classroom_observation_disciplinaries_path(@discipline_director, @year, @classroom)
    else
      flash[:error] = 'Error : Observation didn t save'
      render :new, locals: {observation_disciplinary: @observation_disciplinary}
    end
  end

  def observation_disciplinary_params
    params.require(:observation_disciplinary).permit(:promotion_id, :observation, :date)
  end
end