class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end


  def create 
    bird = Bird.create( production_params)
    render json: bird, status: :created

  end

  private

  def production_params
    params.permit(:name, :species)
  end

end