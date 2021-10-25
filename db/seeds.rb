# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.create([
  {title: 'First Article', content: 'This is the first article', visible: true},
  {title: 'Second Article', content: 'This is the second article', visible: true},
  {title: 'Third Article', content: 'This is the third article', visible: true},
  {title: 'Fourth Article', content: 'This is the fourth article', visible: true},
  {title: 'Fifth Article', content: 'This is the fifth article', visible: true},
])
