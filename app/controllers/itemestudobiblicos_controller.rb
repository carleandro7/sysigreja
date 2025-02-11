class ItemestudobiblicosController < ApplicationController
  def create
    @itemestudobiblico = Itemestudobiblico.new(itemestudobiblico_params)
    if @itemestudobiblico.save
      flash[:success] = "Item adicionada com sucesso!"
      respond_to do |format|
        format.html { redirect_to estudobiblico_path(@itemestudobiblico.estudobiblico_id) }
        format.js   # Isso permite a manipulação remota para recarregar a página.
      end
    else
      flash[:error] = "Erro ao adicionar a Item."
      redirect_to estudobiblico_path(@itemestudobiblico.estudobiblico_id)
    end
  end

  private

  def itemestudobiblico_params
    params.require(:itemestudobiblico).permit(:descricao, :estudobiblico_id)
  end
end
