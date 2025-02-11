module VisitaigrejasHelper
  def listVisitaigrejasAll
    @visitaigrejas = Visitaigreja.all.order(:nome)
  end
end
