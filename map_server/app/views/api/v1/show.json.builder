
project ||= @project

  json.id project['id']
  json.name project['name']
  json.source_name project['source_name']
  json.source_identifier project['source_identifier']
  json.task_count project['task_count']
  if project.class == Hash
    json.active
  Project.find(project['id']).active_for_user?(@api_key.user)
  else
    json.active project.active_for_user?(@api_key.user)
  end

  if project.class == ActiveRecord::Base && !project.persisted? &&
  !project.valid?
    json.errors project.errors.messages
end
