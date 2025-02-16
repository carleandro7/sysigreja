class MinistroubiblicosController < ApplicationController
  before_action :set_ministroubiblico, only: %i[ show edit update destroy ]

  # GET /ministroubiblicos or /ministroubiblicos.json
  def index
    @ministroubiblicos = Ministroubiblico.all
  end

  # GET /ministroubiblicos/1 or /ministroubiblicos/1.json
  def show
  end

  # GET /ministroubiblicos/new
  def new
    @ministroubiblico = Ministroubiblico.new(data: Time.zone.today)
  
    # Buscar os usuários relacionados a um `visitabiblico` do usuário logado
    users = User.joins(:estudousers)
                .where(estudousers: { visitabiblico_id: current_user.estudousers.pluck(:visitabiblico_id) })
                .distinct
  
    # Criar registros aninhados para cada usuário encontrado
    users.each do |user|
      @ministroubiblico.ministroubiblicousers.build(user: user)
    end
  
    # 🔥 Buscar todas as `visitaigrejas` associadas a um `visitabiblico` do usuário logado
    @listVisitaigrejasAll = Visitaigreja.joins(:visitabiblicos)
                                        .where(visitabiblicos: { id: current_user.estudousers.pluck(:visitabiblico_id) })
                                        .distinct
  end
  
  
  
  # GET /ministroubiblicos/1/edit
  def edit
    # Buscar todas as `visitaigrejas` associadas ao `@ministroubiblico`
    visitaigrejas_existentes = @ministroubiblico.estudoministrados.pluck(:visitaigreja_id)
  
    # Buscar todas as `visitaigrejas` que o usuário logado tem acesso via `visitabiblico`
    visitaigrejas_permitidas = Visitaigreja.joins(:visitabiblicos)
                                           .where(visitabiblicos: { id: current_user.estudousers.pluck(:visitabiblico_id) })
                                           .pluck(:id)
    #   1. `visitaigrejas` já associadas ao `@ministroubiblico`
    #   2. `visitaigrejas` que o usuário pode adicionar
    @listVisitaigrejasAll = Visitaigreja.where(id: visitaigrejas_existentes + visitaigrejas_permitidas).distinct
  end
  

  # POST /ministroubiblicos or /ministroubiblicos.json
  def create
    @ministroubiblico = Ministroubiblico.new(ministroubiblico_params)
    @ministroubiblico.user_id = current_user.id
  
    # 🔥 Remover os estudoministrados que foram desmarcados (`_destroy = "0"`)
    @ministroubiblico.estudoministrados.each do |estudo|
      if params[:ministroubiblico][:estudoministrados_attributes].values.any? { |e| e["visitaigreja_id"] == estudo.visitaigreja_id.to_s && e["_sava_visita"] == "0" }
        estudo.mark_for_destruction
      end
    end
  
    respond_to do |format|
      if @ministroubiblico.save
        format.html { redirect_to @ministroubiblico, notice: mensagem_usuario("salvo") }
        format.json { render :show, status: :created, location: @ministroubiblico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ministroubiblico.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /ministroubiblicos/1 or /ministroubiblicos/1.json
  def update
    respond_to do |format|
      if @ministroubiblico.update(ministroubiblico_params)
        # 🔥 Remover os `estudoministrados` que foram desmarcados (`_sava_visita = "0"`)
        @ministroubiblico.estudoministrados.each do |estudo|
          if params[:ministroubiblico][:estudoministrados_attributes].values.any? { |e| e["visitaigreja_id"] == estudo.visitaigreja_id.to_s && e["_sava_visita"] == "0" }
            estudo.mark_for_destruction
          end
        end
  
        @ministroubiblico.save # 🔥 Salva as mudanças, removendo os `estudoministrados` desmarcados
  
        format.html { redirect_to @ministroubiblico, notice: mensagem_usuario("atualizado") }
        format.json { render :show, status: :ok, location: @ministroubiblico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ministroubiblico.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /ministroubiblicos/1 or /ministroubiblicos/1.json
  def destroy
    @ministroubiblico.destroy!

    respond_to do |format|
      format.html { redirect_to ministroubiblicos_path, status: :see_other, notice: mensagem_usuario("excluido")  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ministroubiblico
      @ministroubiblico = Ministroubiblico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ministroubiblico_params
      params.require(:ministroubiblico).permit(:conteudo, :data, :igreja_id, :estudobiblico_id, :itemestudobiblico_id, :user_id,
      ministroubiblicousers_attributes: [:id, :user_id, :_destroy],
      estudoministrados_attributes: [:id, :visitaigreja_id, :_sava_visita, :_destroy])
    end
end
