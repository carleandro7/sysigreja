class IgrejasController < ApplicationController
  before_action :set_igreja, only: %i[ show edit update destroy ]

  # GET /igrejas or /igrejas.json
  def index
    if params[:nome] == nil
      @igrejas = Igreja.all.order("igrejas.nome ASC").page(params[:page]).per(20)
    else
      @igrejas = Igreja.all
      .where("igrejas.nome ILIKE  '%#{params[:nome].strip}%'").order("igrejas.nome ASC").page(params[:page]).per(20)
    end
  end

  # GET /igrejas/1 or /igrejas/1.json
  def show
  end

  # GET /igrejas/new
  def new
    @igreja = Igreja.new
  end

  # GET /igrejas/1/edit
  def edit
  end

  # POST /igrejas or /igrejas.json
  def create
    @igreja = Igreja.new(igreja_params)

    respond_to do |format|
      if @igreja.save
        format.html { redirect_to @igreja, notice: mensagem_usuario("salvo") }
        format.json { render :show, status: :created, location: @igreja }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @igreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /igrejas/1 or /igrejas/1.json
  def update
    respond_to do |format|
      if @igreja.update(igreja_params)
        format.html { redirect_to @igreja, notice:  mensagem_usuario("alterado")}
        format.json { render :show, status: :ok, location: @igreja }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @igreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /igrejas/1 or /igrejas/1.json
  def destroy
    @igreja.destroy!

    respond_to do |format|
      format.html { redirect_to igrejas_path, status: :see_other, notice:  mensagem_usuario("excluido") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_igreja
      @igreja = Igreja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def igreja_params
      params.require(:igreja).permit(:nome, :distrito_id)
    end
end
