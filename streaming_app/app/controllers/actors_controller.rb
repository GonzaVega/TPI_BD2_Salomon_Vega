class ActorsController < ApplicationController
  before_action :set_actor, only: %i[ show edit update destroy ]

  # GET /actors or /actors.json
  def index
    @actors = Actor.where(activo: true)
  end

  # GET /actors/1 or /actors/1.json
  def show
  end

  # GET /actors/new
  def new
    @actor = Actor.new
  end

  # GET /actors/1/edit
  def edit
  end

  # POST /actors or /actors.json
  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: "Actor creado correctamente." }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @actor.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /actors/1 or /actors/1.json
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: "Actor actualizado correctamente.", status: :see_other }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @actor.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /actors/1 or /actors/1.json
  # Baja lógica: no se borra el documento, solo se marca como inactivo.
  def destroy
    @actor.update(activo: false)

    respond_to do |format|
      format.html { redirect_to actors_path, notice: "Actor desactivado correctamente.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actor_params
      params.require(:actor).permit(:nombre, :nacionalidad, :fecha_nacimiento, :activo)
    end
end
