class ApplicationController < ActionController::Base
  before_action :usuario, :except => [:menuusuariologado]
  layout :layout

  def authenticated_use
		if current_user
			current_user.id.to_s+"-"+" Usuário "+"-"+current_user.nome
		else
		  'Usuário não logado'
		end
	end

	def menuusuariologado
    if current_user.nil?
      respond_to do |format|
        format.html { redirect_to new_user_session_url }
      end
    elsif current_user
      respond_to do |format|
        format.html { redirect_to menu_users_url }
      end
    end
  end

	def usuario
	  if current_user != nil
			authenticate_user!
		else
			authenticate_user!
		end
	end

  def layout
		if current_user != nil
			@layout = "application"
		else
			@layout = "applicationlogin" 
		end
	end

  def permissao_negada
		respond_to do |format|
			format.html { redirect_to permissaonegada_users_url, danger: 'Permissão Negada!' }
		end
	end

	def mensagem_usuario(op)
		mensagem={"salvo"=>"Salvo com sucesso!", "alterado"=>"Alterado com sucesso!",
					"excluido"=> "Excluído com sucesso!", "error" => "Erro ao realizar a operação!",
				"excluidoarquivo"=>"Excluído arquivos do lote"}
		return mensagem[op]
	end

end
