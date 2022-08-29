# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."

User.find_or_create_by!(email: "test@fin.cl") {|record| record.encrypted_password = '123456'}

Roadmap.find_or_create_by!(title:'El camino para convertirte en dev en 3 meses') {|record| record.project_link:'https://fintual.notion.site/Paraffin-7eeb003d91614a2cbed2a2e260efde61'}

Checkpoint.find_or_create_by!(title:'Intro to Git') {|record| record.roadmap_id:Roadmap.first()}

puts "Seeding done."