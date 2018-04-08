class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    Task.first.nil? ? @task.position = 1 : @task.position = Task.last.id + 1
    @task.save
    redirect_to root_path, notice: I18n.t("notice.tasks.destroy")
  end

  def update
    @task.update(task_params)
    redirect_to root_path, notice: I18n.t("notice.tasks.destroy")
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: I18n.t("notice.tasks.destroy")
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :position, :expired_on)
  end
end
