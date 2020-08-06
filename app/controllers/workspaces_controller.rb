class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:edit, :update, :destroy]

  def index
    @workspaces = policy_scope(Workspace)
  end

  def my_workspaces
    @my_workspaces = Workspace.where(user: current_user)
    authorize @my_workspaces
  end

  def show
    @workspace = Workspace.find(params[:id])
    @booking = Booking.new
    authorize @workspace
  end

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

  def edit
  end

  def update
    @workspace.update(workspace_params)
    redirect_to new_workspace_path
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
