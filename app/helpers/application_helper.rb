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

    def list_estados
      @list_estado =  
      [ 
      ["AC","AC"],
      ["AL","AL"],
      ["AP","AP"],
      ["AM","AM"],
      ["BA","BA"],
      ["CE","CE"],
      ["ES","ES"],
      ["GO","GO"],
      ["MA","MA"],
      ["MT","MT"],
      ["MS","MS"],
      ["MG","MG"],
      ["PA","PA"],
      ["PB","PB"],
      ["PR","PR"],
      ["PE","PE"],
      ["PI","PI"],
      ["RJ","RJ"],
      ["RN","RN"],
      ["RS","RS"],
      ["RO","RO"],
      ["RR","RR"],
      ["SC","SC"],
      ["SP","SP"],
      ["SE","SE"],
      ["TO","TO"],
      ["DF","DF"]]
  end

  def list_genero
      @list_genero =  
      [ 
      ["Feminino","Feminino"],
      ["Masculino","Masculino"],
      ["Outro","Outro"]]
  end

end

