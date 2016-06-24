class Api::V1::ItemsController < ApiController
  before_action :find_list
  before_action :find_item, only: [:show, :update, :destroy]

  # GET /api/v1/lists/:list_id/items
  def index
    @items = @list.items
    render json: @items
  end

  # GET /api/v1/lists/:list_id/items/:id
  def show
    render json: @item
  end

  # POST /api/v1/lists/:list_id/items
  def create
    @item = @list.items.build(item_params)

    if @item.save
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity # status code 422
    end
  end

  # PUT /api/v1/lists/:list_id/items/:id
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errros, status: :unprocessable_entity # status code 422
    end
  end

  # DELETE /api/v1/lists/:list_id/items/:id
  def destroy
    @item.destroy
    render json: { success: true }
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_item
    @item = @list.items.find(params[:id])
  end
end
