class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  # INDEX
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @islands = Island.where(sql_query, query: "%#{params[:query]}%")
    else
      @islands = Island.all
    end
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
    @island = Island.find(params[:id])
    @island.destroy
    redirect_to islands_path
  end

  # EDIT
  def edit
    @island = Island.find(params[:id])
  end

  # UPDATE
  def update
    @island = Island.find(params[:id])
    if @island.update(island_params)
      redirect_to island_path(@island)
    else
      render :edit
    end
  end

  # PRIVATE PARAMS
  private

  def island_params
    params.require(:island).permit(:name, :location, :price_per_night, :description, :max_guests, :photo)
  end
end
