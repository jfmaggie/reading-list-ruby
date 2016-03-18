class ListsController < ApplicationController

  # GET /lists, all lists
  def index
    @lists = List.all
  end

  # GET /lists/:id, single list
  def show
    @list = List.find(params[:id])
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
      flash[:notice] = "List #{@list.name} was successfully created!"
      redirect_to root_path
    else
      # if @list.save fails
      flash[:alert] = "Something went wrong!"
      render 'new'
    end
  end

  # GET /lists/:id/edit, to show the form that will be used for editing list with id == :id
  def edit
    @list = List.find(params[:id])
  end

  # PUT /lists/:id, to update the list with id == :id
  def update
    @list = List.find(params[:id])
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
    @list = List.find(params[:id])
    @list.destroy

    flash[:notice] = "List destroyed!"
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
