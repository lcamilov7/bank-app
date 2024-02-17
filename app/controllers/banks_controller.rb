class BanksController < ApplicationController
  # Seteamos la instancia de Bank para los métodos especificados
  before_action :set_bank, only: %i[show edit update destroy]

  def index
    # Guardamos todas las instancias de Bank en variable @banks, ordenado por ID
    @banks = Bank.all.order(:id)
  end

  def show; end

  def new
    # Una nueva instancia de Bank para el form
    @bank = Bank.new
  end

  def create
    # Creamos instancia de Bank con los params recibidos
    @bank = Bank.new(bank_params)

    # Si @bank se guarda redirección al template show del bank recién creado, si no se guarda, renderizamos nuevamente el template new
    if @bank.save
      redirect_to bank_url(@bank), notice: 'Bank created succesfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  # Si la instancia @bank se guarda correctamente, redirección a su template show correspondiente, si no, renderizamos nuevamente el template :edit
  def update
    if @bank.update(bank_params)
      redirect_to bank_url(@bank), notice: 'Bank updated succesfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Eliminamos la instancia y redireccionamos al index de banks
  def destroy
    @bank.destroy!

    redirect_to banks_url, notice: 'Bank deleted'
  end

  # Estos metodos private solo podran ser llamados desde la misma clase
  private

  # Seteamos la instancia de bank la cual será usada por el callback before_action para los métodos especificados
  def set_bank
    @bank = Bank.find(params[:id])
  end

  # Definimos strong params para el form recibido por metodo create y update por metodos de seguridad
  def bank_params
    params.require(:bank).permit(:name, :nit, :phone)
  end
end
