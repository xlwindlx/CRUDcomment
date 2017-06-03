# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Faker::Config.locale = "ko"
for i in 1..5
    posts = Post.create(title: Faker::Name.name, content: Faker::Lorem.sentence)
    for j in 1..5
        comments = Comment.create(content: Faker::Lorem.sentence, post_id: posts.id)
    end
end