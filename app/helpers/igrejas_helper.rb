module IgrejasHelper
  def listIgrejasAll
    @igrejas = Igreja.all.order(:nome)
  end
end
