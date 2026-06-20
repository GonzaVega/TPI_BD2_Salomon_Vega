class CatalogosController < ApplicationController
  before_action :set_catalogo, only: %i[ show edit update destroy ]

  # GET /catalogos or /catalogos.json
  def index
    @catalogos = Catalogo.where(disponible: true)
  end

  # GET /catalogos/1 or /catalogos/1.json
  def show
  end

  # GET /catalogos/new
  def new
    @catalogo = Catalogo.new
    temporada = @catalogo.temporadas.build
    2.times { temporada.episodios.build }
  end

  # GET /catalogos/1/edit
  def edit
  end

  # POST /catalogos or /catalogos.json
  def create
    @catalogo = Catalogo.new(catalogo_params)

    respond_to do |format|
      if @catalogo.save
        format.html { redirect_to @catalogo, notice: "Catálogo creado correctamente." }
        format.json { render :show, status: :created, location: @catalogo }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @catalogo.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /catalogos/1 or /catalogos/1.json
  def update
    respond_to do |format|
      if @catalogo.update(catalogo_params)
        format.html { redirect_to @catalogo, notice: "Catálogo actualizado correctamente.", status: :see_other }
        format.json { render :show, status: :ok, location: @catalogo }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @catalogo.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /catalogos/1 or /catalogos/1.json
  # Baja lógica: no se borra el documento, solo se marca como no disponible.
  def destroy
    @catalogo.update(disponible: false)

    respond_to do |format|
      format.html { redirect_to catalogos_path, notice: "Catálogo desactivado correctamente.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogo
      @catalogo = Catalogo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catalogo_params
      params.require(:catalogo).permit(
        :titulo, :tipo, :sinopsis, :clasificacion, :disponible, :lanzamiento,
        :generos_string,
        actor_ids: [],
        temporadas_attributes: [
          :id, :numero_temporada, :lanzamiento, :_destroy,
          episodios_attributes: [ :id, :episodio_id, :titulo_episodio, :duracion_segundos, :_destroy ]
        ]
      )
    end
end
