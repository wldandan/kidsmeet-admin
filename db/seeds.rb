# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
connection = ActiveRecord::Base.connection()

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/agents_2015-03-01.sql'))
end

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/agents_roles_2015-03-01.sql'))
end

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/attendances_2015-03-01.sql'))
end

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/ckeditor_assets_2015-03-01.sql'))
end

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/events_2015-03-01.sql'))
end

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/roles_2015-03-01.sql'))
end

ActiveRecord::Base.transaction do
  connection.execute(File.read('db/data/users_2015-03-01.sql'))
end
