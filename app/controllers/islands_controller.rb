class IslandsController < ApplicationController
  # INDEX
  def index
    @islands = Island.all
  end

  # NEW
  def new
    @island = Island.new
  end

  # SHOW
  def show
    @island = Island.find(params[:id])
  end

  # CREATE
  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  # DESTROY
  def destroy
  end

  # EDIT
  def edit
  end

  # UPDATE
  def update
  end

  # PRIVATE PARAMS
  private

  def island_params
    params.require(:island).permit(:name, :location, :price_per_night, :description, :max_guests, :photo)
  end
end
