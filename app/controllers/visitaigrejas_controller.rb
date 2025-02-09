class VisitaigrejasController < ApplicationController
  before_action :set_visitaigreja, only: %i[ show edit update destroy ]

  # GET /visitaigrejas or /visitaigrejas.json
  def index
    if params[:nome] == nil
      @visitaigrejas = Visitaigreja.all.order("visitaigrejas.nome ASC").page(params[:page]).per(20)
    else
      @visitaigrejas = Visitaigreja.all
      .where("visitaigrejas.nome ILIKE  '%#{params[:nome].strip}%' AND visitaigrejas.igreja_id = #{params[:codigreja]}").order("visitaigrejas.nome ASC").page(params[:page]).per(20)
    end
  end

  # GET /visitaigrejas/1 or /visitaigrejas/1.json
  def show
  end

  # GET /visitaigrejas/new
  def new
    @visitaigreja = Visitaigreja.new
  end

  # GET /visitaigrejas/1/edit
  def edit
  end

  # POST /visitaigrejas or /visitaigrejas.json
  def create
    @visitaigreja = Visitaigreja.new(visitaigreja_params)

    respond_to do |format|
      if @visitaigreja.save
        format.html { redirect_to @visitaigreja, notice: mensagem_usuario("salvo")}
        format.json { render :show, status: :created, location: @visitaigreja }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitaigreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitaigrejas/1 or /visitaigrejas/1.json
  def update
    respond_to do |format|
      if @visitaigreja.update(visitaigreja_params)
        format.html { redirect_to @visitaigreja, notice: mensagem_usuario("alterado")}
        format.json { render :show, status: :ok, location: @visitaigreja }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitaigreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitaigrejas/1 or /visitaigrejas/1.json
  def destroy
    @visitaigreja.destroy!

    respond_to do |format|
      format.html { redirect_to visitaigrejas_path, status: :see_other, notice: mensagem_usuario("excluido") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitaigreja
      @visitaigreja = Visitaigreja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitaigreja_params
      params.require(:visitaigreja).permit(:nome, :apelido, :telefone, :whatsapp_telefone, :cep, :logradouro, :numero, :bairro, :cidade, :estado, :latitude, :longitude, :observacao, :igreja_id)
    end
end
