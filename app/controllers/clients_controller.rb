class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @clients = Client.global_search(params[:query])
    else
      @clients = Client.all.order('id DESC')
    end

    respond_to do |format|
      format.html # Flujo normal que hace rails
      format.text { render partial: "clients/table", locals: {clients: @clients}, formats: [:html] }
    end
  end

  def show; end

  def new
    @client = Client.new
    @client.build_account
  end

  def create
    @client = Client.new(client_params)
    # @client.account.number = Faker::Bank.account_number
    @client.make_account_number
    if @client.save!
      redirect_to clients_url, notice: 'Client created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to clients_url, notice: 'Client modified successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy!

    redirect_to clients_url, notice: 'Client deleted'
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :document_type, :document_number, :phone, account_attributes: %i[bank_id id])
  end
end
