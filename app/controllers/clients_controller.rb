class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
    @client.build_account
  end

  def create
    @client = Client.new(client_params)
    @client.account.number = Faker::Bank.account_number
    if @client.save!
      redirect_to bank_path(@client.bank), notice: 'Client created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :document_type, :document_number, :phone, account_attributes: [:bank_id])
  end
end
