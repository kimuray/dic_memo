class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # TODO: あとから消す
  def taskboard
    @project = Project.find(params[:project_id])
  end
end
