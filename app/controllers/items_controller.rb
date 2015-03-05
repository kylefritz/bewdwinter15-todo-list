class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    item = Item.create!(item_params)

    redirect_to list_path(item.list)
  end

  def destroy
    item = Items.find(params[:id])
    item.destroy

    redirect_to list_path(item.list)
  end

  private

  def item_params
    params.require(:item).permit(:name, :due_at).merge(list_id: params[:list_id])
  end
end
