class ItemsController < ApplicationController
  before_action :find_list

  # GET /lists/:list_id/items/:id
  def show
    @item = @list.items.find(params[:id])
  end

  # GET /lists/:list_id/items/new
  def new
    @item = Item.new
  end

  # POST /lists/:list_id/items
  def create
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to @list
    else
      render "new"
    end
  end

  # GET /lists/:list_id/items/:id/edit
  def edit
    @item = @list.items.find(params[:id])
  end

  # PATCH/PUT /lists/:list_id/items/:id
  def update
    @item = @list.items.find(params[:id])
    if @item.update(item_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  # DELETE /lists/:list_id/items/:id
  def destroy
    @item = @list.items.find(params[:id])
    @item.destroy

    redirect_to @list
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
