class ListsController < ApplicationController

  # GET /lists, all lists
  def index
    @lists = List.all
  end

  # GET /lists/new, to show form that will be used for creating a list
  def new
    @list = List.new
  end

  # POST /lists, endpoint to insert list into db
  def create
    @list = List.new(list_params)

    if @list.save
      # if @list.save succeeds
      redirect_to root_path
    else
      # if @list.save fails
      render 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
