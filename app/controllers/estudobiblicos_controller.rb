class EstudobiblicosController < ApplicationController
  before_action :set_estudobiblico, only: %i[ show edit update destroy ]

  # GET /estudobiblicos or /estudobiblicos.json
  def index
    if params[:nome] == nil
      @estudobiblicos = Estudobiblico.all.order("estudobiblicos.nome ASC").page(params[:page]).per(20)
    else
      @estudobiblicos = Estudobiblico.all
      .where("estudobiblicos.nome ILIKE  '%#{params[:nome].strip}%'").order("estudobiblicos.nome ASC").page(params[:page]).per(20)
    end
  end

  # GET /estudobiblicos/1 or /estudobiblicos/1.json
  def show
  end

  # GET /estudobiblicos/new
  def new
    @estudobiblico = Estudobiblico.new
  end

  # GET /estudobiblicos/1/edit
  def edit
  end

  # POST /estudobiblicos or /estudobiblicos.json
  def create
    @estudobiblico = Estudobiblico.new(estudobiblico_params)

    respond_to do |format|
      if @estudobiblico.save
        format.html { redirect_to @estudobiblico, notice: mensagem_usuario("salvo") }
        format.json { render :show, status: :created, location: @estudobiblico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estudobiblico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estudobiblicos/1 or /estudobiblicos/1.json
  def update
    respond_to do |format|
      if @estudobiblico.update(estudobiblico_params)
        format.html { redirect_to @estudobiblico, notice:  mensagem_usuario("alterado") }
        format.json { render :show, status: :ok, location: @estudobiblico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estudobiblico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudobiblicos/1 or /estudobiblicos/1.json
  def destroy
    @estudobiblico.destroy!

    respond_to do |format|
      format.html { redirect_to estudobiblicos_path, status: :see_other, notice: mensagem_usuario("excluido")  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudobiblico
      @estudobiblico = Estudobiblico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estudobiblico_params
      params.require(:estudobiblico).permit(:nome, :descricao,
       itemestudobiblicos_attributes: [:id, :descricao, :_destroy])
    end
end
