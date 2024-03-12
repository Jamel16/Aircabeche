class CabechesController < ApplicationController
  def index
    @cabeches = Cabeche.all
  end

  def show
    @cabeche = Cabeche.find(params[:id])
  end

  def new
    @cabeche = Cabeche.new
  end

  def create
    @cabeche = Cabeche.new(cabeche_params)
    if @cabeche.save!
      redirect_to cabeche_path(@cabeche)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cabeche = Cabeche.find(params[:id])
  end

  def update
    @cabeche = Cabeche.find(params[:id])
    if @cabeche.update!(cabeche_params)
      redirect_to cabeche_path(@cabeche)
    else
      render :edit
    end
  end

  def destroy
    @cabeche = Cabeche.find(params[:id])
    @cabeche.destroy
    redirect_to cabeche_path, status: :see_other
  end

  private

  def cabeche_params
    params.require(:cabeche).permit(:adress, :name, :description, :price_per_minute)
  end
end
