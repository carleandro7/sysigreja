module DistritosHelper
  def listDistritosAll
    @distritos = Distrito.all.order(:nome)
  end
end
