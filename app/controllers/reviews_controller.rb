class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
  	@restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_reviews_path(@restaurant)
    else
      render :new
    end
  end

  # def update
  #   @task.update(task_params)

  #   redirect_to tasks_path(@task)
  # end

  # def destroy 
  #   @task.destroy

  #   # no need for app/views/restaurants/destroy.html.erb
  #   redirect_to tasks_path
  # end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:review).permit(:content, :rating)
  end
end
