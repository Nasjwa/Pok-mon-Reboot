# app/controllers/trainers_controller.rb
class TrainersController < ApplicationController
  def index
    @trainers = Trainer.order(:name)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to trainer_path(@trainer), notice: "Trainer created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def trainer_params
    params.require(:trainer).permit(:name, :age, :photo)
  end
end
