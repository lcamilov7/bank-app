class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @client = Client.new
    @client.build_account
  end

  def create
    @account = Account.new(account_params)
    @account.number = Faker::Bank.account_number
    @account.save
    # Creamos intancia de client usando los params que llegan de la vista
    # y asignamos la cuenta recien creada @account como asociación
    @client = Client.new(client_params.merge(account: @account))
    @client.save

    redirect_to root_path, notice: 'Client created'
  end

  def edit
    @account = @client.account
  end

  def update
    @account.update(account_params)
    @client.update(client_params.merge(account: @account))

    redirect_to root_path
  end

  def destroy
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :document_type, :document_number, :phone)
  end

  def account_params
    params[:client].require(:account).permit(:bank_id)
  end
end
