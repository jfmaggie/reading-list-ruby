class Api::V1::ListsController < ApiController
  before_action :find_list, only: [:show, :update, :destroy]
  # GET /api/v1/lists
  def index
    @lists = List.all
    render json: @lists
  end

  # GET /api/v1/lists/:id
  def show
    render json: @list
  end

  # POST /api/v1/lists
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/lists/:id
  def update
    if @list.update(list_params)
      # if the update succeeds
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/lists/:id
  def destroy
    @list.destroy
    render json: { success: true }
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
