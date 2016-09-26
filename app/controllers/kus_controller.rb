class KusController < ApplicationController
  def index
      @kus = Ku.new
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def set_prototype
    @ku = Ku.find(params[:id])
  end


end
