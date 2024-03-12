class CabechesController < ApplicationController
  before_action :cabeche_find, only: [:show, :create, :edit, :update, :destroy]

  def index
    @cabeches = Cabeche.all
  end

  def show
  end

  def new
    @cabeche = Cabeche.new
  end

  def create
    @cabeche = Cabeche.new(cabeche_params)
    @cabeche.user = current_user
    if @cabeche.save!
      redirect_to cabeche_path(@cabeche)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @cabeche.user = current_user
    if @cabeche.update!(cabeche_params)
      redirect_to cabeche_path(@cabeche)
    else
      render :edit
    end
  end

  def destroy
    @cabeche.destroy
    redirect_to cabeche_path, status: :see_other
  end

  private

  def cabeche_find
    @cabeche = Cabeche.find(params[:id])
  end

  def cabeche_params
    params.require(:cabeche).permit(:adress, :name, :description, :price_per_minute)
  end
end
