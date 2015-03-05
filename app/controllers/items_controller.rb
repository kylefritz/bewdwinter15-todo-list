class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    list = List.find(params[:list_id])
    item = list.items.create!(item_params)

    redirect_to list_path(item.list)
  end

  def edit
    @item = Item.find(params[:id])
    @list = @item.list
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)

    redirect_to list_path(item.list)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to list_path(item.list)
  end

  private

  def item_params
    params.require(:item).permit(:name, :due_at)
  end
end
