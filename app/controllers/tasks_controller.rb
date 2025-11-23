class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice_create] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      flash[:notice_no_create] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice_update] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:notice_no_update] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice_destroy] = "スケジュールを削除しました"
    redirect_to :tasks
  end

  private
  def task_params  # プライベートメソッド
    params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo)
  end

end
