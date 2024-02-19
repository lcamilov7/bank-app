class ClientsController < ApplicationController
  # Seteamos la instancia de Client para los métodos especificados
  before_action :set_client, only: %i[show edit update destroy]

  # Si en el hash params existe una key llamada query, @clients será igual a todas las instancias de
  # Client que cumplan con el metodo global_search, definido mas abajo, si no, @clients sera igual a
  # todas las instancias de Client ordenadas por ID de forma descendente
  def index
    if params[:query].present?
      @clients = Client.global_search(params[:query])
    else
      @clients = Client.all.order('id DESC')
    end

    # Si el formato que recibe es HTML, osea el normal de Rails, el flujo será el normal
    # Si recibe un formato de tipo texto, renderizamos el partial de table de las views de clients
    # y le pasamos la variable local que utilizará
    respond_to do |format|
      format.html
      format.text { render partial: 'clients/table', locals: { clients: @clients}, formats: [:html] }
    end
  end

  def show; end

  # Definimos nueva instancia de Client para el form y su respectiva instancia de account
  #  Lo hacemos en el mismo metodo ya que sera un form para ambas instancias y usaremos
  # nested forms
  def new
    @client = Client.new
    @client.build_account
  end

  # @client sera la nueva instancia de Client y recibe los params del form, seguido le asignamos
  # un numero de cuenta con el metodo de clase make_account_number
  def create
    @client = Client.new(client_params)
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
      redirect_to client_url(@client), notice: 'Client modified successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy!

    redirect_to clients_url, notice: 'Client deleted', status: :see_other
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  # Definimos metodo para aceptar los strong params y incluimos tambien los atributos para la instancia de account asociada
  def client_params
    params.require(:client).permit(:name, :document_type, :document_number, :phone, account_attributes: %i[bank_id id])
  end
end
