crumb :root do
  link "Início", root_path
end

crumb :groups do
  link "Todos os grupos", groups_path
end

crumb :group do |g|
  link g.name, g
  parent :groups
end

crumb :group_task do |t|
  t.title ||= ""
  link t.title
  parent :group, t.group
end

crumb :users do
  link "Todos os usuários", users_path
end

crumb :user do |u|
  link u.name, u
  parent :users
end
