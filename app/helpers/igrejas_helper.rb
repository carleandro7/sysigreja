module IgrejasHelper
  def listIgrejasAll
    @igrejas = Igreja.all
  end
end
