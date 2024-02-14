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
    @account = Account.new(account_params)
    @account.number = '12345'
    @account.save
    @client = Client.new(client_params.merge(account: @account))
    @client.save


    redirect_to root_path
    # if @client.save
    #   redirect_to banks_url, notice: 'Client created'
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def client_params
    params.require(:client).permit(:name, :document_type, :document_number, :phone)
  end

  def account_params
    params[:client].require(:account).permit(:bank_id)
  end
end
