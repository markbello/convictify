class CellsController < ApplicationController

  skip_before_action :authorized, only: [:show, :index]

  def show
    @cell = Cell.find(params[:id])
  end
end
