module DistritosHelper
  def listDistritosAll
    @distritos = Distrito.all
  end
end
