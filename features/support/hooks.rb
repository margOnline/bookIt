Before('@created_resource') do
  Resource.create name: 'Centre court'
end

Before('@multiple_resources') do
  Resource.create name: 'Centre court'
  Resource.create name: 'Suzanne Lenglan'
end