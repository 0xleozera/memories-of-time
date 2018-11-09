class MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  before_action :set_weather_options, only: [:new, :create, :edit, :update]

  def index
    @memories = MemoriesService.get_all(current_user)
  end

  def show
  end

  def new
    @memory = MemoriesService.new_memory
  end

  def edit
  end
  
  def create
    new_memory = MemoriesService.create(current_user, memory_params)

    respond_to do |format|
      if new_memory
        format.html { redirect_to memories_path, notice: 'Memory was successfully created.' }
        format.json { render :show, status: :created, location: @memory }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to @memory, notice: 'Memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to memories_url, notice: 'Memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_weather_options
    @weather_options = WeatherService.list_weathers
  end

    def set_memory
      @memory = MemoriesService.get_by_id(current_user, params)
    end

    def memory_params
      params.require(:memory).permit(:description, :city, :temperature, :lat, :long, :day, :weather_id)
    end
end
