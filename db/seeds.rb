
p "Felele is cleaning the database."
Restaurant.delete_all
Item.delete_all
Order.delete_all

p "Welcome the seed"


luigi = Restaurant.create!(
  name: "Risotrante Luigi eeehhhhh👌"
  address: "Calle Italia, 69, Germany"
  )

pasta = Item.create!(
	name: "Appetizer Carbonara",
	description: "Carbonara is an Italian pasta dish from Rome made with egg, hard cheese, guanciale, and black pepper. The dish arrived at its modern form, with its current name, in the middle of the 20th century. The cheese is usually Pecorino Romano, Parmigiano-Reggiano, or a combination of the two. Spaghetti is the most common pasta, but fettuccine, rigatoni, linguine, or bucatini are also used.",
	price: 14,
	type: "food_app",
	image: XXXXXXXXXXXXXXXX,
  restaurant_id: Restaurant.last
	)

tiramisu = Item.create!(
  name: "Tiramisu",
  description: "An Italian dessert consisting of layers of sponge cake soaked in coffee and brandy or liqueur with powdered chocolate and mascarpone cheese.",
  price: 8,
  type: "food_dessert",
  image: XXXXXXXXXXXXXXXX,
  restaurant_id: Restaurant.last
  )

risotto = Item.create!(
  name: "Risotto",
  description: "Risotto is a northern Italian rice dish cooked with broth until it reaches a creamy consistency. The broth can be derived from meat, fish, or vegetables. Many types of risotto contain butter, onion, white wine, and parmesan cheese.",
  price: 17,
  type: "food_main",
  image: XXXXXXXXXXXXXXXX
  restaurant_id: Restaurant.last
  )

gelato = Item.create!(
  name: "Gelato",
  description: "Gelato is a popular frozen dessert of Italian origin. It is generally made with a base of 3.25percent milk and sugar. It is generally lower in fat than other styles of frozen desserts. Gelato typically contains 70percent less air and more flavoring than other kinds of frozen desserts, giving it a density and richness that distinguishes it from other ice creams.",
  price: 8,
  type: "food_dessert",
  image: XXXXXXXXXXXXXXXX
  restaurant_id: Restaurant.last
  )

wine = Item.create!(
  name: "Wine",
  description: "Grape Juice for adults. Its wine. Red. Maybe White. Bruuuuv",
  price: 9,
  type: "drink",
  image: XXXXXXXXXXXXXXXX
  restaurant_id: Restaurant.last
  )

p "Busted my seed.... Complete"
