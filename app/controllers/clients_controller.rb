class ClientsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @client = Client.new
    @client.build_account
  end

  def create
    @client = Client.new(client_params)
    @client.account.number = '13242134'

    if @client.save
      redirect_to banks_url, notice: 'Client created'
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

  def client_params
    params.require(:client).permit(:name, :document_type, :document_number, :phone, account_attributes: [:bank_id])
  end
end
