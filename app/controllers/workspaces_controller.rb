class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show]

  def index
    @workspaces = Workspace.all
  end

  def show
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end
end
