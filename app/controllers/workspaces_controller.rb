class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy]

  def new
    @workspace = Workspace.new
    authorize @workspace
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user
    authorize @workspace

    if @workspace.save
      redirect_to @workspace, notice: 'Your new workspace was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @workspace.destroy
    redirect_to workspaces_url, notice: 'Your workspace was successfully deleted.'
  end

  def set_workspace
    @workspace = Workspace.find(params[:id])
    authorize @workspace
  end

  def workspace_params
    params.require(:workspace).permit(:name, :address, :description, :price, :seats)
  end
end
