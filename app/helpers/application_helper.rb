module ApplicationHelper
  def list_tipo_usuario
		@list =  
        [["Administrador",0], 
        ["Outro",1]]
	end

  def list_tipo_usuario_invertida
		@list =  
        {0=>"Administrador", 1=>"Outro"}
	end

  def list_status
		@list =  
        [["Desativado",0], 
        ["Ativo",1]]
	end

    def list_boolean
		@list =  
        [["Sim","Sim"], 
        ["Não","Não"]]
	end

  def list_status_invertida
		@list =  
        {0=>"Desativado", 1=>"Ativo"}
	end

  def list_opcoes
		@list =  
        [["Não",0], 
        ["Sim",1]]
	end
  
  def list_opcoes_invertida
		@list =  
        {0=>"Não", 
        1=>"Sim"}
	end

  def sub_escrever_texto(texto)
		horaAtual = Time.now
        texto = texto.gsub('#{mes}', mes(horaAtual.strftime("%m").to_i)) 
		texto = texto.gsub('#{dia}', horaAtual.strftime("%d")) 
		texto = texto.gsub('#{ano}', horaAtual.strftime("%Y")) 
		texto = texto.gsub('#{hora}', horaAtual.strftime("%H:%M")) 
        return texto 
    end

    def mes(valor)
        list = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
        return list[valor-1]
    end
end

