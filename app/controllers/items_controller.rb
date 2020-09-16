class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
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

def item_params
  params.require(:item).permit(:name, :introduction, :price, :image, :category_id, :condition_id, :prefecture_code_id, :ship_cost_id, :ship_date_id).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end
