
p "Cleaning the database."
Item.delete_all
Order.delete_all
Restaurant.delete_all

p "We are now going to seed"

Restaurant.create!(
  name: "Luigi",
  address: "Calle Italia, 69, Germany",
  remote_restaurant_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/b068ce0e08159aece78342fc895919dc_jr6mrn.jpg"
  )

pasta = Item.create!(
	name: "Appetizer Carbonara",
	description: "Carbonara is an Italian pasta dish from Rome made with egg, hard cheese, guanciale, and black pepper. The dish arrived at its modern form, with its current name, in the middle of the 20th century. The cheese is usually Pecorino Romano, Parmigiano-Reggiano, or a combination of the two. Spaghetti is the most common pasta, but fettuccine, rigatoni, linguine, or bucatini are also used.",
	price: 14,
  food_type: "food_app",
	remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/pasta-carbonara-horiz-a-1200_xophqp.jpg",
  restaurant_id: Restaurant.last.id
	)

tiramisu = Item.create!(
  name: "Tiramisu",
  description: "An Italian dessert consisting of layers of sponge cake soaked in coffee and brandy or liqueur with powdered chocolate and mascarpone cheese.",
  price: 8,
  food_type: "food_dessert",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888557/Food%20Items/t13_esbwu0.jpg",
  restaurant_id: Restaurant.last.id
  )

risotto = Item.create!(
  name: "Risotto",
  description: "Risotto is a northern Italian rice dish cooked with broth until it reaches a creamy consistency. The broth can be derived from meat, fish, or vegetables. Many types of risotto contain butter, onion, white wine, and parmesan cheese.",
  price: 17,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/mushroom-risotto-horiz-b-1800_ay0tsu.jpg",
  restaurant_id: Restaurant.last.id
  )

gelato = Item.create!(
  name: "Gelato",
  description: "Gelato is a popular frozen dessert of Italian origin. It is generally made with a base of 3.25percent milk and sugar. It is generally lower in fat than other styles of frozen desserts. Gelato typically contains 70percent less air and more flavoring than other kinds of frozen desserts, giving it a density and richness that distinguishes it from other ice creams.",
  price: 8,
  food_type: "food_dessert",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/b068ce0e08159aece78342fc895919dc_jr6mrn.jpg",
  restaurant_id: Restaurant.last.id
  )

wine = Item.create!(
  name: "Wine",
  description: "Grape Juice for adults. Its wine. Red. Maybe White. Bruuuuv",
  price: 9,
  food_type: "drink",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/red-white-wine_r46vgf.jpg",
  restaurant_id: Restaurant.last.id
  )

p "Busted my seed.... Complete"
