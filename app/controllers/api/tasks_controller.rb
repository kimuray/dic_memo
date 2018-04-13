class Api::TasksController < ApplicationController
  def create
    @task = Line.find(params[:line_id]).tasks.build(task_params)
    @task.user = current_user
    
    if @task.save
      render json: @task
    end
  end

  private

  def task_params
    params.fetch(:task, {}).permit(:content, :expired_on)
  end
end
