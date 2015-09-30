json.array!(@shits) do |shit|
  json.extract! shit, :id, :user_id, :article_id, :body
  json.url shit_url(shit, format: :json)
end
