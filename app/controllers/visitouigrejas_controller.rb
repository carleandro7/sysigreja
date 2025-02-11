class VisitouigrejasController < ApplicationController
  before_action :set_visitouigreja, only: %i[ show edit update destroy ]

  # GET /visitouigrejas or /visitouigrejas.json
  def index
    @visitouigrejas = Visitouigreja.all
  end

  # GET /visitouigrejas/1 or /visitouigrejas/1.json
  def show
  end

  # GET /visitouigrejas/new
  def new
    @visitouigreja = Visitouigreja.new
  end

  # GET /visitouigrejas/1/edit
  def edit
  end

  # POST /visitouigrejas or /visitouigrejas.json
  def create
    @visitouigreja = Visitouigreja.new(visitouigreja_params)

    respond_to do |format|
      if @visitouigreja.save
        format.html { redirect_to @visitouigreja, notice: "Visitouigreja was successfully created." }
        format.json { render :show, status: :created, location: @visitouigreja }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitouigreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitouigrejas/1 or /visitouigrejas/1.json
  def update
    respond_to do |format|
      if @visitouigreja.update(visitouigreja_params)
        format.html { redirect_to @visitouigreja, notice: "Visitouigreja was successfully updated." }
        format.json { render :show, status: :ok, location: @visitouigreja }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitouigreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitouigrejas/1 or /visitouigrejas/1.json
  def destroy
    @visitouigreja.destroy!

    respond_to do |format|
      format.html { redirect_to visitouigrejas_path, status: :see_other, notice: "Visitouigreja was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitouigreja
      @visitouigreja = Visitouigreja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitouigreja_params
      params.require(:visitouigreja).permit(:igreja_id, :visitaigreja_id, :data, :descricao)
    end
end
