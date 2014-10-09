json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :post_id, :comment
  json.url discussion_url(discussion, format: :json)
end
