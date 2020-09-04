class ItemsController < ApplicationController
  def index
  end

  def new
    @items= Items.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
   
  end

  def show
  end

  private

  def items_params
  end

end
