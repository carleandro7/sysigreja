module EstudobiblicosHelper
  def listEstudobiblicosAll
    @estudobiblicos = Estudobiblico.all.order(:nome)
  end
end
