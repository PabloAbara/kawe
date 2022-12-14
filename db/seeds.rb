# This file should contain all the record creation needed to seed the database with
# its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside
# the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Rails.logger.debug "Seeding..."

# users
users = []
[1, 2, 3].each do |a|
  user = User.where(email: "test#{a}@fin.cl").first
  if user
    users.append(user)
  else
    new_user = User.create!(email: "test#{a}@fin.cl", name: "test#{a}", password: "123456",
                            password_confirmation: "123456", role: "student")
    users.append(new_user)
  end
end

mentor_user = User.where(email: "mentor@fin.cl").first
mentor_user ||= User.create!(email: "mentor@fin.cl", name: "Mentor", password: "123456",
                             password_confirmation: "123456", role: "mentor")

# Roadmap
rmap = Roadmap.find_or_create_by!(title: "El camino para convertirte en dev en 3 meses",
                                  project_link: "https://fintual.notion.site/Paraffin-7eeb003d91614a2cbed2a2e260efde61")

# Checkpoints
c1 = Checkpoint.find_or_create_by!(title: "Intro to Git", roadmap_id: rmap.id)
c2 = Checkpoint.find_or_create_by!(title: "Intro to Docker", roadmap_id: rmap.id)
c3 = Checkpoint.find_or_create_by!(title: "Intro to Ruby", roadmap_id: rmap.id)

# resources
r1 = Resource.find_or_create_by!(title: "Guía de trabajo GIT",
                                 link: "https://www.freecodecamp.org/espanol/news/git-101-un-flujo-de-trabajo-de-git/",
                                 checkpoint_id: c1.id)
r2 = Resource.find_or_create_by!(title: "GIT para dummies", link: "https://www.w3schools.com/git/",
                                 checkpoint_id: c1.id)
r3 = Resource.find_or_create_by!(title: "Docker 101", link: "https://www.docker.com/101-tutorial/",
                                 checkpoint_id: c2.id)
r4 = Resource.find_or_create_by!(title: "Tutorial Docker",
                                 link: "https://www.tutorialspoint.com/docker/index.htm",
                                 checkpoint_id: c2.id)
Resource.find_or_create_by!(title: "Ruby Quickstart",
                            link: "https://www.ruby-lang.org/es/documentation/quickstart/",
                            checkpoint_id: c3.id)
Resource.find_or_create_by!(title: "Tutorial Ruby",
                            link: "https://www.tutorialspoint.com/ruby/index.htm",
                            checkpoint_id: c3.id)

# resource_ratings
ResourceRating.find_or_create_by!(user_id: users[0].id, resource_id: r1.id, rating: 5)
ResourceRating.find_or_create_by!(user_id: users[0].id, resource_id: r3.id, rating: 2)
ResourceRating.find_or_create_by!(user_id: users[1].id, resource_id: r2.id, rating: 4)
ResourceRating.find_or_create_by!(user_id: users[1].id, resource_id: r4.id, rating: 3)
ResourceRating.find_or_create_by!(user_id: users[2].id, resource_id: r1.id, rating: 3)
ResourceRating.find_or_create_by!(user_id: users[2].id, resource_id: r3.id, rating: 1)
ResourceRating.find_or_create_by!(user_id: users[0].id, resource_id: r2.id, rating: 4)
ResourceRating.find_or_create_by!(user_id: users[2].id, resource_id: mentor_user.id, rating: 5)

# Completed checkpoints
CompletedCheckpoint.find_or_create_by!(user_id: users[0].id, checkpoint_id: c1.id)
CompletedCheckpoint.find_or_create_by!(user_id: users[1].id, checkpoint_id: c1.id)
CompletedCheckpoint.find_or_create_by!(user_id: users[1].id, checkpoint_id: c2.id)
CompletedCheckpoint.find_or_create_by!(user_id: users[2].id, checkpoint_id: c1.id)
CompletedCheckpoint.find_or_create_by!(user_id: users[2].id, checkpoint_id: c3.id)

# Admin user
AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password", role: "mentor")

Rails.logger.debug "Seeding done."
