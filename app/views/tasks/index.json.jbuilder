json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :goal_id, :person_id, :team, :active, :parent, :task_type
  json.url task_url(task, format: :json)
end
