class AccountsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @account = Account.new
    @client = @account.build_client
  end

  def create
    account = Account.new(account_params)

    if account.save
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

  private

  def account_params
    params.require(:account).permit(:bank_id, client_attributes: [:name, :document_type, :document_number, :phone])
  end
end
