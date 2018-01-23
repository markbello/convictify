class CellBlocksController < ApplicationController

  before_action :set_cell_block, only: [:show, :edit, :update, :destroy]

  def index
    @cell_bocks = CellBlock.all
  end

  def show

  end

  def new
    @cell_block = CellBlock.new
  end

  def create
    #byebug
    @cell_block = CellBlock.create(cell_block_params)
    if @cell_block.valid?
      redirect_to @cell_block
    else
      flash[:error] = @cell_block.errors.full_messages
      redirect_to new_cell_block_path
    end
  end

  def edit

  end

  def update
    #byebug
    @cell_block = CellBlock.update(cell_block_params)
    if @cell_block.valid?
      redirect_to @cell_block
    else
      flash[:error] = @cell_block.errors.full_messages
      redirect_to new_cell_block_path
    end
  end

  def destroy
    @cell_block.destroy
    redirect_to cell_blocks_path
  end

  private

  def cell_block_params
    params.require(:cell_block).permit(:name, :security_rating)

  end

  def set_cell_block
    @cell_block = CellBlock.find(params[:id])
  end

end
