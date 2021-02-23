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
  end

  # CREATE
  def create
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

end
