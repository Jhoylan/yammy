class RestaurantsController < ApplicationController
  def index
  end

  def login    
  end

  def shopping_restaurants
    all_restaurants = Restaurant.all

    @shopping_restaurants = []

    all_restaurants.each do |restaurant|
      if restaurant.shopping == params[:id]
        temp = {}
        temp[:name] =  restaurant.name
        temp[:menu_link] =  "/menu/" << restaurant.id.to_s << "/"

        @shopping_restaurants.push(temp)
      end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def all
    username_is_correct = params[:username][:field] == "adm"
    password_is_correct = params[:password][:field] == "123456"

    @restaurants = Restaurant.all

    if username_is_correct && password_is_correct
      render :all
    else
      render :login
    end
  end

  def new
    @restaurant = Restaurant.new    
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])    
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to root_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :shopping, :image_link)
  end
end
