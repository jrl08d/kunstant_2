json.array!(@goals) do |goal|
  json.extract! goal, :id, :description, :done, :user_id
  json.url goal_url(goal, format: :json)
end
