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
