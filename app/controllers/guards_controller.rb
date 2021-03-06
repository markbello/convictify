class GuardsController < ApplicationController

  before_action :set_guard, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:new, :create, :index, :show]

  def index
    @guards = Guard.all
  end

  def show
    @prisoners = Prisoner.all
    @cell_blocks = CellBlock.all
  end

  def new
    @guard = Guard.new
    @cell_blocks = CellBlock.all
  end

  def create
    guard_params[:first_name].capitalize!
    guard_params[:last_name].capitalize!
    @guard = Guard.new(guard_params)

    random_block_index = rand(CellBlock.all.count - 1)
    @guard.cell_block = CellBlock.find(random_block_index)


    if @guard.valid?
      @guard.save
      session[:user_id] = @guard.id
      redirect_to @guard
    else
      flash[:error] = @guard.errors.full_messages
      redirect_to new_guard_path
    end
  end

  def edit
    @cell_blocks = CellBlock.all
  end

  def update
    # byebug
    @guard.update(guard_params)

    if @guard.valid?
      redirect_to @guard
    else
      flash[:error] = @guard.errors.full_messages
      redirect_to edit_guard_path(@guard)
    end
  end

  def destroy
    @guard.destroy

    redirect_to guards_path
  end

  private

  def guard_params
    params.require(:guard).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )

    # Use the below if integrating an array of foreign keys
    # params.require(:guard).permit(#:name, foreign_ids: [])
  end

  def set_guard
    @guard = Guard.find(params[:id])
  end

end
