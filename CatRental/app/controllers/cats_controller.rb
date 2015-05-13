class CatsController < ApplicationController

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      render :show
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def index
    @cats = Cat.all

    render :index
  end

  def new
    @cat = Cat.new
    render :new
  end

  def show
    @cat = Cat.find(params[:id])

    render :show
  end

  def edit
    @cat = Cat.find(params[:id])

    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)

      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end

  end

  private
    def cat_params
      params[:cat].permit(:name, :birth_date, :color, :sex, :description)
    end

end
