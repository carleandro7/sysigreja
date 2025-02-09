class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if params[:nome] == nil
      @users = User.all.order("users.nome ASC").page(params[:page]).per(20)
    else
      #variavel que recebe pesquisa solicitada pelo usuario
      @users = User.all.where("users.nome ILIKE  '%"+params[:nome].strip+"%'").order("users.nome ASC").page(params[:page]).per(20)
    end 
  end

  def alterarsenha
    if current_user == nil
      permissaoNegada
    else
      @user = User.find(current_user.id)  
    end 
  end

  def alterarsenha
    if current_user == nil
      permissaoNegada
    else
      @user = User.find(current_user.id)  
    end 
  end


  # GET /users/1 or /users/1.json
  def show
   
  end

  # GET /users/new
  def new
    
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.instituica_id = current_user.instituica_id
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: mensagem_usuario("salvo")  }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: mensagem_usuario("alterado") }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: mensagem_usuario("excluido") }
        format.json { head :no_content }
      end

  end

  def permissaonegada
  end

  def menu
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nome, :tipo, :telefone, :email, :password, :igreja_id)
    end
end
