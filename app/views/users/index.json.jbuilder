json.array!(@users) do |user|
  json.extract! user, :id, :username, :fullname, :password_digest
  json.url user_url(user, format: :json)
end
