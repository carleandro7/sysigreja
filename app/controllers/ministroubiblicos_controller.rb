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
    @ministroubiblico = Ministroubiblico.new
  end

  # GET /ministroubiblicos/1/edit
  def edit
  end

  # POST /ministroubiblicos or /ministroubiblicos.json
  def create
    @ministroubiblico = Ministroubiblico.new(ministroubiblico_params)

    respond_to do |format|
      if @ministroubiblico.save
        format.html { redirect_to @ministroubiblico, notice: "Ministroubiblico was successfully created." }
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
        format.html { redirect_to @ministroubiblico, notice: "Ministroubiblico was successfully updated." }
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
      format.html { redirect_to ministroubiblicos_path, status: :see_other, notice: "Ministroubiblico was successfully destroyed." }
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
      params.require(:ministroubiblico).permit(:conteudo, :data, :visitaigreja_id, :visitabiblico_id, :estudobiblico_id, :itemestudobiblico_id)
    end
end
