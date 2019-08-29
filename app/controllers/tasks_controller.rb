class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    if @task.save
      respond_to do |format|
        format.html{
          redirect_to root_path
          flash[:notice] = "Task created"
        }
        format.js{}
      end
    else
      respond_to do |format|
        format.html{
          redirect_to root_path
          flash[:notice] = "Please try again"
        }
        format.js{}
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])

    statusValue = params[:statusValue]

    if statusValue.to_i == 0
      @task.status = true
    else
      @task.status = false
    end
    
    if @task.save()
      respond_to do |format|
        format.html{
          redirect_to root_path
          flash[:notice] = "Task edited"
        }
        format.js{}
      end
    end
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    respond_to do |format|
      format.html{
        redirect_to root_path
        flash[:notice] = "Task created"
      }
      format.js{}
    end

  end


  private

  def task_params
    params.permit(:title, :deadline, :description, :status, :id)
  end

  def category_params
    params.require(:Category)
  end

end
