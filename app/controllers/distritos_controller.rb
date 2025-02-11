class DistritosController < ApplicationController
  before_action :set_distrito, only: %i[ show edit update destroy ]

  # GET /distritos or /distritos.json
  def index
    if params[:nome] == nil
      @distritos = Distrito.all.order("distritos.nome ASC").page(params[:page]).per(20)
    else
      @distritos = Distrito.all
      .where("distritos.nome ILIKE  '%#{params[:nome].strip}%'").order("distritos.nome ASC").page(params[:page]).per(20)
    end
  end

  # GET /distritos/1 or /distritos/1.json
  def show
  end

  # GET /distritos/new
  def new
    @distrito = Distrito.new
  end

  # GET /distritos/1/edit
  def edit
  end

  # POST /distritos or /distritos.json
  def create
    @distrito = Distrito.new(distrito_params)

    respond_to do |format|
      if @distrito.save
        format.html { redirect_to @distrito, notice:  mensagem_usuario("salvo")}
        format.json { render :show, status: :created, location: @distrito }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @distrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distritos/1 or /distritos/1.json
  def update
    respond_to do |format|
      if @distrito.update(distrito_params)
        format.html { redirect_to @distrito, notice:  mensagem_usuario("alterado")}
        format.json { render :show, status: :ok, location: @distrito }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @distrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distritos/1 or /distritos/1.json
  def destroy
    @distrito.destroy!

    respond_to do |format|
      format.html { redirect_to distritos_path, status: :see_other, notice:  mensagem_usuario("excluido") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distrito
      @distrito = Distrito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def distrito_params
      params.require(:distrito).permit(:nome)
    end
end
