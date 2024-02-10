class YearsController < ApplicationController
    def index
      @years = Year.all
    end
 
    def show
      @year = Year.find_by(id: params[:id])
      @periodes = @year.periodes
    end

    def new
      @year = Year.new
    end
  
    def create

      @year = Year.new(year_params)
      respond_to do |format|
        format.html do
          if @year.save
            flash[:success] = 'year saved successfully'
            redirect_to years_path
          else
            flash.now[:error] = "Error : year didn't save"
            render :new, locals: { year: @year }
          end
        end
      end
    end
  
    def year_params
      params.require(:year).permit(:name, :description)
    end
  end
  