# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
shelter2 = Shelter.create(name: "Baby Bunnies", address: "22 Shelter Ave", city: "Apple Cider", state: "ME", zip: "04941")
shelter3 = Shelter.create(name: "Snuggle Kitties", address: "123 Kitty Cat Alley", city: "New Mumford", state: "KS", zip: "67893")

kunga = Pet.create(image: "https://upload.wikimedia.org/wikipedia/commons/9/94/My_dog.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
pie = Pet.create(image: "https://www.northpittsburghanimalbehavior.com/wp-content/uploads/2019/01/pexels-photo-1345191-326068071-1547782069522.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)
bunnicula = Pet.create(image:"https://cf.ltkcdn.net/small-pets/images/std/140633-411x292-lop-rabbit.jpg", name: "Bunnicula", approximate_age: "35", sex: "male", shelter_id: shelter2.id)
ruby = Pet.create(image:"https://lafeber.com/mammals/wp-content/uploads/rabbit-outside-px-2218452-900.jpg", name: "Ruby Tuesday", approximate_age: "12", sex: "female", shelter_id: shelter2.id)
pepper = Pet.create(image:"https://static.toiimg.com/photo/msid-67586673/67586673.jpg?3918697", name: "Sgt.Pepper", approximate_age: "11", sex: "male", shelter_id: shelter3.id)

ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "https://upload.wikimedia.org/wikipedia/commons/a/a3/Eccles_Building_Ogden_Utah.jpeg", shelter_id: shelter.id)
ShelterReview.create!(title: "Booyah", rating: "4", content: "I love dogs.", shelter_id: shelter.id)
ShelterReview.create!(title: "The Cat's Meow!", rating: "3", content: "Cats are nice", image: "https://upload.wikimedia.org/wikipedia/commons/2/25/Vincenti_buildings.jpeg", shelter_id: shelter2.id)
ShelterReview.create!(title: "Woop", rating: "4", content: "Kitty power", shelter_id: shelter2.id)
ShelterReview.create!(title: "Cuties Abound", rating: "3", content: "Rabbits make great pets", image: "https://images.squarespace-cdn.com/content/v1/5b302d38a9e0287c5afc8def/1535520291221-US4780W9GYGN3D7PGG3Z/ke17ZwdGBToddI8pDm48kJLEq3OxTtMnHNVBlYskh0l7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0scl71iiVnMuLeEyTFSXT3ojQelNJ7D9foYbkSdOkZ5wsSiFVHUZQz5EHdaM1j0QlA/SCU+Buildings+A+and+B-2.jpeg", shelter_id: shelter3.id)
ShelterReview.create!(title: "Hippitty Hop", rating: "2", content: "Hello little bunny", shelter_id: shelter3.id)

application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")
application_2 = AdoptionApplication.create(name: "Stellar", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm still awesome")
application_3 = AdoptionApplication.create(name: "Ana", address: "happy street", city: "Blue Hair", state: "CO", zip: "12344", phone_number: "123-4556", description: "I will give them so much love.")
application_4 = AdoptionApplication.create(name: "Ethel", address: "happy street", city: "Blue Hair", state: "CO", zip: "12344", phone_number: "123-4556", description: "I will give them so much love.")
