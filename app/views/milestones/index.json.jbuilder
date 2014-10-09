json.array!(@milestones) do |milestone|
  json.extract! milestone, :id, :description, :project_id
  json.url milestone_url(milestone, format: :json)
end
