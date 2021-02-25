class IslandsController < ApplicationController
  # INDEX

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def index
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    # @islands = Island.where(location: params[:query])
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
