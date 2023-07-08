class ListsController < ApplicationController
  before_action :set_list, only: [:destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new()
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "List successfully created"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @list.destroy
    redirect_to lists_url, notice: "List was successfully destroyed.", status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
