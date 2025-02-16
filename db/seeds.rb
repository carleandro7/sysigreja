# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Distrito.create!([nome: "Distrito 1"])
Distrito.create!([nome: "Distrito 2"])
Igreja.create!([nome: "Igreja 1", distrito_id: 1])
Igreja.create!([nome: "Igreja 2", distrito_id: 1])
Igreja.create!([nome: "Igreja 3", distrito_id: 2])
Igreja.create!([nome: "Igreja 4", distrito_id: 2])
User.create!([nome: "Admin", email: "teste1@gmail.com", tipo: 0, telefone: '(99) 99999-9999', password: "123456", igreja_id: 1])
User.create!([nome: "Admin2", email: "teste2@gmail.com", tipo: 1, telefone: '(99) 99999-9999', password: "123456", igreja_id: 1])
User.create!([nome: "Admin3", email: "teste3@gmail.com", tipo: 0, telefone: '(99) 99999-9999', password: "123456", igreja_id: 2])
User.create!([nome: "Admin4", email: "teste4@gmail.com", tipo: 1, telefone: '(99) 99999-9999', password: "123456", igreja_id: 2])


# Criando Visitaigrejas
visitas = [
  { nome: "Visita Igreja 1", apelido: "V1", telefone: "(99) 98888-8888", whatsapp_telefone: 1, 
    cep: "64000-000", logradouro: "Rua A", numero: "123", bairro: "Centro", cidade: "Cidade 1", estado: "PI", 
    latitude: "-5.0910", longitude: "-42.8016", observacao: "Primeira visita", igreja_id: 1 },
    
  { nome: "Visita Igreja 2", apelido: "V2", telefone: "(99) 97777-7777", whatsapp_telefone: 1, 
    cep: "64000-000", logradouro: "Rua B", numero: "456", bairro: "Bairro B", cidade: "Cidade 2", estado: "PI", 
    latitude: "-5.0920", longitude: "-42.8026", observacao: "Segunda visita", igreja_id: 1 },

  { nome: "Visita Igreja 3", apelido: "V3", telefone: "(99) 96666-6666", whatsapp_telefone: 1, 
    cep: "64000-000", logradouro: "Rua C", numero: "789", bairro: "Bairro C", cidade: "Cidade 3", estado: "PI", 
    latitude: "-5.0930", longitude: "-42.8036", observacao: "Terceira visita", igreja_id: 1 },

  { nome: "Visita Igreja 4", apelido: "V4", telefone: "(99) 95555-5555", whatsapp_telefone: 1, 
    cep: "64000-000", logradouro: "Rua D", numero: "321", bairro: "Bairro D", cidade: "Cidade 4", estado: "PI", 
    latitude: "-5.0940", longitude: "-42.8046", observacao: "Quarta visita", igreja_id: 1 }
]

visitas.each do |visita|
  Visitaigreja.find_or_create_by!(nome: visita[:nome]) do |v|
    v.apelido = visita[:apelido]
    v.telefone = visita[:telefone]
    v.whatsapp_telefone = visita[:whatsapp_telefone]
    v.cep = visita[:cep]
    v.logradouro = visita[:logradouro]
    v.numero = visita[:numero]
    v.bairro = visita[:bairro]
    v.cidade = visita[:cidade]
    v.estado = visita[:estado]
    v.latitude = visita[:latitude]
    v.longitude = visita[:longitude]
    v.observacao = visita[:observacao]
    v.igreja_id = visita[:igreja_id]
  end
end
