# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dialect.create(name: "yoda", front_name: "Yoda")
Dialect.create(name: "valley", front_name: "Valley Girl")
Dialect.create(name: "binary", front_name: "Binary")
Dialect.create(name: "piglatin", front_name: "Pig Latin")
Dialect.create(name: "haxor", front_name: "Simple Hax0r")