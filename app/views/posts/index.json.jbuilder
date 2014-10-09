json.array!(@posts) do |post|
  json.extract! post, :id, :project_id, :post_text
  json.url post_url(post, format: :json)
end
