json.project do
  json.id @project.id
  json.name @project.name
  json.lines do
    json.array! @project.lines do |line|
      json.id line.id
      json.title line.title
      json.position line.position
      json.tasks do
        json.array! line.tasks do |task|
          json.id task.id
          json.content task.content
          json.position task.position
        end
      end
    end
  end
end
