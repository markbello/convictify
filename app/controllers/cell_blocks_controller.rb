class CellBlocksController < ApplicationController

  before_action :set_cell_block, only: [:show]
  skip_before_action :authorized, only: [:show, :index]

  def index
    @cell_blocks = CellBlock.all
  end

  def show
  end

  private

  def cell_block_params
    params.require(:cell_block).permit(:name, :security_rating)

  end

  def set_cell_block
    @cell_block = CellBlock.find(params[:id])
  end

end
