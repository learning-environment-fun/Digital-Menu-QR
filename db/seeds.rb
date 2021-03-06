
p "Cleaning the database."
OrderItem.destroy_all
Order.destroy_all
Table.destroy_all
Restaurant.destroy_all
User.destroy_all


p "Cleaned the database."


p "Creating customers uuuhhhh"
owner = User.create(is_restaurant_owner: true, email: "owner@mail.com", password: "12345678")
customer1 = User.create!(email: "customer1@mail.com", password: "12345678")
customer3 = User.create!(email: "customer3@mail.com", password: "12345678")
customer4 = User.create!(email: "customer4@mail.com", password: "12345678")
customer2 = User.create!(email: "customer2@mail.com", password: "12345678")
customer5 = User.create!(email: "customer5@mail.com", password: "12345678")
customer6 = User.create!(email: "customer6@mail.com", password: "12345678")
customer7 = User.create!(email: "customer7@mail.com", password: "12345678")
customer8 = User.create!(email: "customer8@mail.com", password: "12345678")
customer9 = User.create!(email: "customer9@mail.com", password: "12345678")
customer10 = User.create!(email: "customer10@mail.com", password: "12345678")
customer11 = User.create!(email: "customer11@mail.com", password: "12345678")
customer12 = User.create!(email: "customer12@mail.com", password: "12345678")

p "Users and owners have been established..."

p "We are now going to seed the database"

luigi = Restaurant.create!(
  name: "Luigi",
  owner: owner,
  address: "Calle Italia, 69, Germany",
  remote_image_url: "https://images.unsplash.com/photo-1526234362653-3b75a0c07438?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1789&q=80"
  )

## APPETIZERS

bruschetta = Item.create!(
  name: "Bruschetta on Sourdough Bread",
  description: "Bruschetta is an antipasto from Italy consisting of grilled bread rubbed kinkely with garlic and topped with olive oil and salt",
  price: 7,
  food_type: "food_app",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563976839/Food%20Items/bruschetta-tomato-basil-horiz-a-1600_lmduln.jpg",
  restaurant_id: luigi.id
  )

squid = Item.create!(
  name: "Grilled Squid with Lemon Juice",
  description: "Freshly cuaght squid, grilled on a coal-fired grill, simply garnished with freshly squeezed lemon juice.",
  price: 8,
  food_type: "food_app",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563977208/Food%20Items/Grilled_Squid_rxrubo.jpg",
  restaurant_id: luigi.id
  )

meatballs = Item.create!(
  name: "Slow-Cooked Italian Meatballs",
  description: "Tender cheesy meatballs are slow cooked in a flavorful sauce made with fresh Italian ingredients.",
  price: 7,
  food_type: "food_app",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563978046/Food%20Items/exps66110_SCM163827D01_26_2b_m7kwzu.jpg",
  restaurant_id: luigi.id
  )

bean_salad = Item.create!(
  name: "Balsamic Green Bean Salad",
  description: "Fresh green beans, blanched and toss with a balsamic vinaigrette, red onions, basil, and Parmesan. We also add fresh Feta Cheese and Tomato.",
  price: 5,
  food_type: "food_app",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563978167/Food%20Items/exps45720_CX2376979A09_14_5b_WEB-3_fishye.jpg",
  restaurant_id: luigi.id
  )

pesto = Item.create!(
  name: "Pesto Pull-Apart Bread",
  description: "A combitnation some of the favorite Italian flavors in an easy bread to complement our Italian meals. House-made pesto , oven-dried tomatoes and roasted red peppers make for a hard-to-beat dish. Great for sharing.",
  price: 6,
  food_type: "food_app",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563978405/Food%20Items/Pesto-Pull-Apart-Bread_EXPS_THD17_194709_D08_15_3b_dzrnlz.jpg",
  restaurant_id: luigi.id
  )

## MAIN DISHES

pasta = Item.create!(
  name: "Traditional Pasta Carbonara",
  description: "Carbonara is an Italian pasta dish from Rome made with egg, hard cheese, guanciale, and black pepper. The dish arrived at its modern form, with its current name, in the middle of the 20th century. The cheese is usually Pecorino Romano, Parmigiano-Reggiano, or a combination of the two. Spaghetti is the most common pasta, but fettuccine, rigatoni, linguine, or bucatini are also used.",
  price: 14,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/pasta-carbonara-horiz-a-1200_xophqp.jpg",
  restaurant_id: luigi.id
  )

risotto = Item.create!(
  name: "Mushroom Risotto",
  description: "Risotto is a northern Italian rice dish cooked with broth until it reaches a creamy consistency. The broth can be derived from meat, fish, or vegetables. Many types of risotto contain butter, onion, white wine, and parmesan cheese.",
  price: 17,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888555/Food%20Items/mushroom-risotto-horiz-b-1800_ay0tsu.jpg",
  restaurant_id: luigi.id
  )

pasta2 = Item.create!(
  name: "Fettucine with Truffle Cream Sauce",
  description: "Wonderful Italian pasta with the freshest truffles you could imagine. Earthy flavors.",
  price: 14,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563977666/Food%20Items/Shaved_Black_Truffle_and_Shitake_Mushroom_Pasta_ruflso.jpg",
  restaurant_id: luigi.id
  )

pasta3 = Item.create!(
  name: "Pumpkin Ravioli with Toasted Sage Butter",
  description: "Lovely fresh ravioli, filled with pumpkin and spinach, topped off with a delightful sage-butter mixture. The roasting of this butter brings out the wonderful scent of the sage.",
  price: 12,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563977666/Food%20Items/021submitmed1_yfwfei.jpg",
  restaurant_id: luigi.id
  )

fish = Item.create!(
  name: "Grilled Sea Bream",
  description: "Grilled Sea Bream, freshly caught in the morning by our local fisherman Charles. Simply grilled with lemon, salt and olive oil, it packs the flavour of the ocean.",
  price: 17,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563977814/Food%20Items/WHOM-09-161-02-rt_pv6kcq.jpg",
  restaurant_id: luigi.id
  )

pizza = Item.create!(
  name: "Pizza Hawaii",
  description: "To truly grasp the depth of this flavor, you must be a cultured person. Those who enjoy it roam the plains of immortals. The best pizza, no matter what anybody says.",
  price: 10,
  food_type: "food_main",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563979161/Food%20Items/Screenshot_2019-07-24_at_16.39.05_zmdonl.png",
  restaurant_id: luigi.id
  )

## DESSERT

gelato = Item.create!(
  name: "Various Gelato",
  description: "Gelato is a popular frozen dessert of Italian origin. It is generally made with a base of 3.25percent milk and sugar. It is generally lower in fat than other styles of frozen desserts. Gelato typically contains 70percent less air and more flavoring than other kinds of frozen desserts, giving it a density and richness that distinguishes it from other ice creams.",
  price: 8,
  food_type: "food_dessert",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563979220/Food%20Items/Screenshot_2019-07-24_at_16.40.14_blweh1.png",
  restaurant_id: luigi.id
  )

tiramisu = Item.create!(
  name: "Tiramisu",
  description: "An Italian dessert consisting of layers of sponge cake soaked in coffee and brandy or liqueur with powdered chocolate and mascarpone cheese.",
  price: 8,
  food_type: "food_dessert",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563888557/Food%20Items/t13_esbwu0.jpg",
  restaurant_id: luigi.id
  )

## DRINKS

wine = Item.create!(
  name: "Red Wine",
  description: "Grape Juice for adults. Its wine. Red. Maybe White. Bruuuuv, we mix it",
  price: 9,
  food_type: "drink",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563978284/Food%20Items/enso-winery-1t_rgt8lq.jpg",
  restaurant_id: luigi.id
  )

wwine = Item.create!(
  name: "White Wine",
  description: "What a yummy yummy white wine. It pairs soooo well with Chciken or Fish, it'll have you white-wine-wasted after an easy bottle.",
  price: 7,
  food_type: "drink",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563978400/Food%20Items/bwc-blog_13-2477_white-wine-edit-705x495_ip6f6n.jpg",
  restaurant_id: luigi.id
  )

beer = Item.create!(
  name: "Beer",
  description: "Makes your fruncle extra frunkly. None of the hipster craft brew shit.",
  price: 4,
  food_type: "drink",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563979866/Food%20Items/o-BEER-DAY-facebook_rtrtua.jpg",
  restaurant_id: luigi.id
  )

cocktail = Item.create!(
  name: "Cocktail",
  description: "Enjoy one of our many cocktails, made with fresh liquor and the zestiest oranges. Farm to Table.",
  price: 7,
  food_type: "drink",
  remote_image_url: "https://res.cloudinary.com/shlongmaster/image/upload/v1563979826/Food%20Items/Screenshot_2019-07-24_at_16.50.14_d1jkpp.png",
  restaurant_id: luigi.id
  )

table = Table.create!(restaurant: luigi, table_number: 1)
table2 = Table.create!(restaurant: luigi, table_number: 2)
table3 = Table.create!(restaurant: luigi, table_number: 3)
table4 = Table.create!(restaurant: luigi, table_number: 4)
table5 = Table.create!(restaurant: luigi, table_number: 5)

Order.create(table: table, restaurant: luigi, user: customer1, start_time: DateTime.now, end_time: (DateTime.now + 10.minutes)  )
Order.create(table: table2, restaurant: luigi, user: customer2, start_time: DateTime.now, end_time: (DateTime.now + 15.minutes) )
Order.create(table: table2, restaurant: luigi, user: customer3, start_time: DateTime.now, end_time: (DateTime.now + 18.minutes) )
Order.create(table: table3, restaurant: luigi, user: customer4, start_time: DateTime.now, end_time: (DateTime.now + 20.minutes) )
Order.create(table: table4, restaurant: luigi, user: customer5, start_time: DateTime.now, end_time: (DateTime.now + 26.minutes) )
Order.create(table: table4, restaurant: luigi, user: customer6, start_time: DateTime.now, end_time: (DateTime.now + 8.minutes) )
Order.create(table: table4, restaurant: luigi, user: customer7, start_time: DateTime.now, end_time: (DateTime.now + 4.minutes) )
Order.create(table: table5, restaurant: luigi, user: customer8, start_time: DateTime.now, end_time: (DateTime.now + 6.minutes) )
Order.create(table: table5, restaurant: luigi, user: customer9, start_time: DateTime.now, end_time: (DateTime.now + 10.minutes) )
Order.create(table: table, restaurant: luigi, user: customer10, start_time: DateTime.now, end_time: (DateTime.now + 11.minutes) )
Order.create(table: table2, restaurant: luigi, user: customer12, start_time: DateTime.now, end_time: (DateTime.now + 10.minutes) )

OrderItem.create(item: Item.last, order: Order.last, quantity: 2, item_price: Item.last.price)

p "Seed complete!"
