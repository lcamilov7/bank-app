class BanksController < ApplicationController
  before_action :set_bank, only: %i[show edit update destroy]

  def index
    @banks = Bank.all
  end

  def show
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to bank_url(@bank), notice: 'Bank created succesfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bank.update(bank_params)
      redirect_to bank_url(@bank), notice: 'Bank updates succesfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    raise
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name, :nit, :phone)
  end
end
