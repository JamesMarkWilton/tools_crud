class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    Tool.create(params[:tool].symbolize_keys)
    redirect_to tools_path
  end

  def edit
    @tool = Tool.find_by_id params[:format]
  end

  def update
    tool = Tool.find_by_id params[:id]
    tool.update name:     params[:tool][:name],
                price:    params[:tool][:price],
                quantity: params[:tool][:quantity]
    redirect_to tool_path(tool)
  end

  def destroy
    Tool.destroy params[:id]
    redirect_to tools_path
  end
end
