class VisitaController < ApplicationController
  before_action :set_visitum, only: %i[ show edit update destroy ]

  # GET /visita or /visita.json
  def index
    @visita = Visitum.all
  end

  # GET /visita/1 or /visita/1.json
  def show
  end

  # GET /visita/new
  def new
    @visitum = Visitum.new
  end

  # GET /visita/1/edit
  def edit
  end

  # POST /visita or /visita.json
  def create
    @visitum = Visitum.new(visitum_params)

    respond_to do |format|
      if @visitum.save
        format.html { redirect_to @visitum, notice: "Visitum was successfully created." }
        format.json { render :show, status: :created, location: @visitum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visita/1 or /visita/1.json
  def update
    respond_to do |format|
      if @visitum.update(visitum_params)
        format.html { redirect_to @visitum, notice: "Visitum was successfully updated." }
        format.json { render :show, status: :ok, location: @visitum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visita/1 or /visita/1.json
  def destroy
    @visitum.destroy!

    respond_to do |format|
      format.html { redirect_to visita_path, status: :see_other, notice: "Visitum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitum
      @visitum = Visitum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitum_params
      params.require(:visitum).permit(:nome, :apelido, :telefone, :whatsapp_telefone, :cep, :logradouro, :numero, :bairro, :cidade, :estado, :latitude, :longitude, :igreja_id)
    end
end
