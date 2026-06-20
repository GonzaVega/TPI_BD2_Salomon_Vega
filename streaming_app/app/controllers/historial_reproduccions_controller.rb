class HistorialReproduccionsController < ApplicationController
  before_action :set_historial_reproduccion, only: %i[ show edit update destroy ]

  # GET /historial_reproduccions or /historial_reproduccions.json
  def index
    @historial_reproduccions = HistorialReproduccion.all
  end

  # GET /historial_reproduccions/1 or /historial_reproduccions/1.json
  def show
  end

  # GET /historial_reproduccions/new
  def new
    @historial_reproduccion = HistorialReproduccion.new
  end

  # GET /historial_reproduccions/1/edit
  def edit
  end

  # POST /historial_reproduccions or /historial_reproduccions.json
  def create
    @historial_reproduccion = HistorialReproduccion.new(historial_reproduccion_params)

    respond_to do |format|
      if @historial_reproduccion.save
        format.html { redirect_to @historial_reproduccion, notice: "Registro de historial creado correctamente." }
        format.json { render :show, status: :created, location: @historial_reproduccion }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @historial_reproduccion.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /historial_reproduccions/1 or /historial_reproduccions/1.json
  def update
    respond_to do |format|
      if @historial_reproduccion.update(historial_reproduccion_params)
        format.html { redirect_to @historial_reproduccion, notice: "Registro de historial actualizado correctamente.", status: :see_other }
        format.json { render :show, status: :ok, location: @historial_reproduccion }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @historial_reproduccion.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /historial_reproduccions/1 or /historial_reproduccions/1.json
  #
  # A diferencia de Usuario, Actor y Catalogo, esta colección NO implementa baja lógica.
  # El historial de reproducción es un registro de actividad (qué vio cada usuario y hasta
  # qué punto), no una entidad de catálogo con estado "activo/inactivo". Por eso el borrado
  # acá es físico: tiene sentido eliminar un registro de actividad puntual sin necesidad de
  # conservarlo como "inactivo", a diferencia de usuarios, contenidos o actores, donde sí
  # interesa mantener el historial para auditoría. Esta decisión está documentada y fue
  # explicada en el coloquio de la Parte 1 del TPI.
  def destroy
    @historial_reproduccion.destroy!

    respond_to do |format|
      format.html { redirect_to historial_reproduccions_path, notice: "Registro de historial eliminado correctamente.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_reproduccion
      @historial_reproduccion = HistorialReproduccion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historial_reproduccion_params
      params.require(:historial_reproduccion).permit(
        :perfil_id, :episodio_id, :segundo_detenido, :visto_completo, :ultima_conexion,
        :usuario_id, :contenido_id
      )
    end
end
