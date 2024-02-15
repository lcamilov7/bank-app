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
    # @account = Account.new(account_params)
    # @account.number = Faker::Bank.account_number
    # @account.save
    # # Creamos instancia de client usando los params que llegan de la vista
    # # y asignamos la cuenta recién creada @account como asociación
    # @client = Client.new(client_params.merge(account: @account))

    # if @client.save
    #   redirect_to root_path, notice: 'Client created'
    # else
    #   render :new, status: :unprocessable_entity
    # end

    @client = Client.new(client_params)
    @client.account.number = Faker::Bank.account_number
    if @client.save!
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:client).permit(:name, :document_type, :document_number, :phone, account_attributes: [:bank_id])
  end

  # def account_params
  #   params[:client].require(:account).permit(:bank_id)
  # end
end
