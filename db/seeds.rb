def create_site_admin
  1.times do |a|
    User.create(email: "site_admin1@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "Site",
                last_name: "Admin",
                roles: "site_admin"
              )
  end

  puts "1 site admin created"
end

def create_users
  5.times do |u|
    User.create(email: "user#{u+1}@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "User#{u+1}",
                last_name: "User")
  end

  puts "#{User.count} users created"
end

create_site_admin
create_users


3.times do |topic|
  Topic.create!(
    title: Faker::Job.field
  )
end

puts "3 Topics created"

50.times do |blog|
  Blog.create!(
    title: Faker::Book.title,
    body: Faker::Hipster.paragraph,
    topic_id: Topic.all.sample.id
  )
end

puts "50 blog posts created"

5.times do |skill|
  lang = ["Ruby", "Angular", "Python", "Go", "Javascript"]
  Skill.create!(
    title: lang[skill],
    percent_utilized: Faker::Number.between(from: 1, to: 100)
  )
end

puts "5 skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: Faker::Job.title,
    subtitle: Faker::ProgrammingLanguage.name,
    body: Faker::Hipster.paragraph,
    # main_image: "http://placehold.it/600x400",
    # thumb_image: "http://placehold.it/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: Faker::Job.title,
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    # main_image: "http://placehold.it/600x400",
    # thumb_image: "http://placehold.it/350x200"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: Faker::Science.science
  )
end

puts "3 technologies created"