class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  # GET /lists, all lists
  def index
    @lists = List.all
    @list = List.new
  end

  # GET /lists/:id, single list
  def show
    @items = @list.items
    @item = Item.new
  end

  # GET /lists/new, to show form that will be used for creating a list
  def new
    @list = List.new
  end

  # POST /lists, endpoint to insert list into db
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        # if @list.save succeeds
        format.html { redirect_to lists_path, notice: "List #{@list.name} was successfully created!" }
        format.js {}
      else
        # if @list.save fails
        format.html { render 'new', alert: "Something went wrong!" }
        format.js {}
      end
    end
  end

  # GET /lists/:id/edit, to show the form that will be used for editing list with id == :id
  def edit
  end

  # PUT /lists/:id, to update the list with id == :id
  def update
    if @list.update(list_params)
      # if the update succeeds
      flash[:notice] = "List #{@list.name} was successfully updated!"
      redirect_to @list
    else
      # if the update fails
      flash[:alert] = "Something went wrong!"
      render 'edit'
    end
  end

  # DELETE /lists/:id, to destroy a list with id == :id
  def destroy
    @list.destroy

    flash[:notice] = "List destroyed!"
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
