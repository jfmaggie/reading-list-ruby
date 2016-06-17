class Api::V1::ListsController < ApiController
  before_action :find_list, only: [:show]
  # GET api/v1/lists
  def index
    @lists = List.all
    render json: @lists
  end

  def show
    render json: @list
  end

  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
