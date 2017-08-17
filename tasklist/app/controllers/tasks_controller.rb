class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @newtask = Task.new
  end
  
  def create
    @newtask = Task.new(newtask_sec)
    if @newtask.save
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'Taskが正常に登録されませんでした'
      render :new
    end
  end
  
  def edit
    @edittask = Task.find(params[:id])
  end
  
  def update
    @updatetask = Task.find(params[:id])
    
    if @updatetask.update(newtask_sec)
      flash[:success] = 'Taskが正常に更新されました'
      redirect_to @updatetask
    else
      flash.now[:danger] = 'Taskが正常に更新されませんでした'
      render :new
    end
    
  end
  
  def destroy
    @deletask = Task.find(params[:id])
    @deletask.destroy
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end
  
  def newtask_sec
    params.require(:task).permit(:content, :status)
  end
end
