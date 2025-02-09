json.extract! user, :id, :nome, :tipo, :telefone, :igreja_id, :created_at, :updated_at
json.url user_url(user, format: :json)
