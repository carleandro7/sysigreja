class VisitabiblicosController < ApplicationController
  before_action :set_visitabiblico, only: %i[ show edit update destroy ]

  # GET /visitabiblicos or /visitabiblicos.json
  def index
    if params[:nome] == nil
      @visitabiblicos = Visitabiblico.all.joins(:visitaigreja).order("visitaigrejas.nome ASC").page(params[:page]).per(20)
    else
      @visitabiblicos = Visitabiblico.all.joins(:visitaigreja).joins(:estudobiblico)
      .where("visitaigrejas.nome ILIKE  '%#{params[:nome].strip}%' AND visitaigrejas.igreja_id = #{params[:codigreja]}
       AND estudobiblicos.id = #{params[:codestudo]}").order("visitaigrejas.nome ASC").page(params[:page]).per(20)
    end
  end

  # GET /visitabiblicos/1 or /visitabiblicos/1.json
  def show
  end

  # GET /visitabiblicos/new
  def new
    @visitabiblico = Visitabiblico.new
  end

  # GET /visitabiblicos/1/edit
  def edit
  end

  # POST /visitabiblicos or /visitabiblicos.json
  def create
    @visitabiblico = Visitabiblico.new(visitabiblico_params)

    respond_to do |format|
      if @visitabiblico.save
        format.html { redirect_to @visitabiblico, notice: mensagem_usuario("salvo")  }
        format.json { render :show, status: :created, location: @visitabiblico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitabiblico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitabiblicos/1 or /visitabiblicos/1.json
  def update
    respond_to do |format|
      if @visitabiblico.update(visitabiblico_params)
        format.html { redirect_to @visitabiblico, notice: mensagem_usuario("alterado") }
        format.json { render :show, status: :ok, location: @visitabiblico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitabiblico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitabiblicos/1 or /visitabiblicos/1.json
  def destroy
    @visitabiblico.destroy!

    respond_to do |format|
      format.html { redirect_to visitabiblicos_path, status: :see_other, notice: mensagem_usuario("excluido") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitabiblico
      @visitabiblico = Visitabiblico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitabiblico_params
      params.require(:visitabiblico).permit(:visitaigreja_id, :estudobiblico_id, :data_inicio, :data_fim, :descricao,
      estudousers_attributes: [:id, :user_id, :_destroy])
    end
end
