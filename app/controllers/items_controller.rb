class ItemsController < ApplicationController
  # GET /lists/:list_id/items/:id
  def show

  end

  # GET /lists/:list_id/items/new
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  # POST /lists/:list_id/items
  def create
    list = List.find(params[:list_id])
    @item = list.items.build(item_params)

    if @item.save
      redirect_to list
    else
      render "new"
    end
  end

  # GET /lists/:list_id/items/:id/edit
  def edit

  end

  # PATCH/PUT /lists/:list_id/items/:id
  def update

  end

  # DELETE /lists/:list_id/items/:id
  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
