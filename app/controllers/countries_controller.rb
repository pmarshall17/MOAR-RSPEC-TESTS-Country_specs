class CountriesController < ApplicationController
  before_action :country, except: [:index, :new, :create]

  def index
  end

  def show
  end

  def new
  	@country = Country.new
  end

  def create
  	@country = Country.new(country_params)

  	if @country.save
  			redirect_to country_path(@country)
  			flash[:success] = 'Country Created!'
  	else
  		render :new
  end

  def update
  	if @country.update (country_params)
  		redirect_to country_path(@country)
  	else
  		render :edit
  end

  def destroy
  	@country.destroy
  	flash[:success] = 'Country Conquered!'
  	redirect_to countries_path
  end

 def edit
 end

	private
		def country 
			@country = Country.find(params[:id])
		end

		def country_params
			params.require(:item).permit(:name, :population, :language)
		end

end
