# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Shopping.create([{ name:"Boulevard" }, { name: "Castanheira" }, { name: "Metrópole" }, { name:"Pátio" }, { name:"Parque" }]) if Rails.env.development?

Restaurant.create([
  { Shopping_id:1, name:"Burger King", image_link:"card1.jpg", menu:"CRISPY CHICKEN/2.19, DOUBLE CHEESEBURGER/2.19, BIG KING/4.99, 2 WHOPPER/9.99, 6 CHILI CHEESE BITES/1.99, 2 CHICKEN ROYALE/9.99, 4 CHICKEN WINGS/1.79, 5 KING NUGGETS/2.49"},
  { Shopping_id:1, name:"McDonald's", image_link:"card2.jpg", menu:"MAHARAJA MAC/14.50, MAHARAJA MAC SPECIAL/14.50, BigSpicy Chicken Wrap/15.00, BigSpicy Paneer Wrap/15.00, McSpicy Chicken/11.80, BigSpicy Paneer/11.40, McChicken/8.10, McVeggie/7.00"}, 
  { Shopping_id:1, name:"Uata?!", image_link:"card3.jpg", menu:"UATATA SUPREMA/10.00, ESPETOS/10.00, UATA DOUBLE/15.00, UATA HEAD/12.00, UATA SHACK/15.00, UATA MIGNON/16.00, UATA CHICKEN/13.00"}, 
  { Shopping_id:1, name:"Divino Fogão",image_link:"card4.jpg", menu:"SOPA DE FEIJÃO/15.00, BIFE A FRANCESA/27.00, SUPREME DE FRANGO/27.00, FILÉ DE SALMÃO/32.00, CARPELETE DE CARNE/22.00, STROGONOFF DE FRANGO/27.00, OMELETE VEGETARIANO/21.00, FILÉ DE FRANGO GRELHADO/26.00, PICANHA GRELHADA/32.00, RISOTO DE FRANGO/24.00, PANQUECA DE CARNE/25.00, CONTRA FILÉ GRELHADO/32.00, FILÉ DE PEIXE GRATINADO/27.00"}, 
  { Shopping_id:1, name:"Lug's", image_link:"card5.jpg", menu:"SAUCE RED/4.90, MOLHO TÁRTARO/4.90, SPICE HOT/4.90, ANGUS ESPECIAL/22.90, BOCA DE ANJO/22.90"}, 

  { Shopping_id:2, name:"Burger King", image_link:"card1.jpg", menu:"CRISPY CHICKEN/2.19, DOUBLE CHEESEBURGER/2.19, BIG KING/4.99, 2 WHOPPER/9.99, 6 CHILI CHEESE BITES/1.99, 2 CHICKEN ROYALE/9.99, 4 CHICKEN WINGS/1.79, 5 KING NUGGETS/2.49"},
  { Shopping_id:2, name:"McDonald's", image_link:"card2.jpg", menu:"MAHARAJA MAC/14.50, MAHARAJA MAC SPECIAL/14.50, BigSpicy Chicken Wrap/15.00, BigSpicy Paneer Wrap/15.00, McSpicy Chicken/11.80, BigSpicy Paneer/11.40, McChicken/8.10, McVeggie/7.00"}, 
  { Shopping_id:2, name:"Uata?!", image_link:"card3.jpg", menu:"UATATA SUPREMA/10.00, ESPETOS/10.00, UATA DOUBLE/15.00, UATA HEAD/12.00, UATA SHACK/15.00, UATA MIGNON/16.00, UATA CHICKEN/13.00"}, 
  { Shopping_id:2, name:"Divino Fogão",image_link:"card4.jpg", menu:"SOPA DE FEIJÃO/15.00, BIFE A FRANCESA/27.00, SUPREME DE FRANGO/27.00, FILÉ DE SALMÃO/32.00, CARPELETE DE CARNE/22.00, STROGONOFF DE FRANGO/27.00, OMELETE VEGETARIANO/21.00, FILÉ DE FRANGO GRELHADO/26.00, PICANHA GRELHADA/32.00, RISOTO DE FRANGO/24.00, PANQUECA DE CARNE/25.00, CONTRA FILÉ GRELHADO/32.00, FILÉ DE PEIXE GRATINADO/27.00"}, 
  { Shopping_id:2, name:"Lug's", image_link:"card5.jpg", menu:"SAUCE RED/4.90, MOLHO TÁRTARO/4.90, SPICE HOT/4.90, ANGUS ESPECIAL/22.90, BOCA DE ANJO/22.90"}, 

  { Shopping_id:3, name:"Burger King", image_link:"card1.jpg", menu:"CRISPY CHICKEN/2.19, DOUBLE CHEESEBURGER/2.19, BIG KING/4.99, 2 WHOPPER/9.99, 6 CHILI CHEESE BITES/1.99, 2 CHICKEN ROYALE/9.99, 4 CHICKEN WINGS/1.79, 5 KING NUGGETS/2.49"},
  { Shopping_id:3, name:"McDonald's", image_link:"card2.jpg", menu:"MAHARAJA MAC/14.50, MAHARAJA MAC SPECIAL/14.50, BigSpicy Chicken Wrap/15.00, BigSpicy Paneer Wrap/15.00, McSpicy Chicken/11.80, BigSpicy Paneer/11.40, McChicken/8.10, McVeggie/7.00"}, 
  { Shopping_id:3, name:"Uata?!", image_link:"card3.jpg", menu:"UATATA SUPREMA/10.00, ESPETOS/10.00, UATA DOUBLE/15.00, UATA HEAD/12.00, UATA SHACK/15.00, UATA MIGNON/16.00, UATA CHICKEN/13.00"}, 
  { Shopping_id:3, name:"Divino Fogão",image_link:"card4.jpg", menu:"SOPA DE FEIJÃO/15.00, BIFE A FRANCESA/27.00, SUPREME DE FRANGO/27.00, FILÉ DE SALMÃO/32.00, CARPELETE DE CARNE/22.00, STROGONOFF DE FRANGO/27.00, OMELETE VEGETARIANO/21.00, FILÉ DE FRANGO GRELHADO/26.00, PICANHA GRELHADA/32.00, RISOTO DE FRANGO/24.00, PANQUECA DE CARNE/25.00, CONTRA FILÉ GRELHADO/32.00, FILÉ DE PEIXE GRATINADO/27.00"}, 
  { Shopping_id:3, name:"Lug's", image_link:"card5.jpg", menu:"SAUCE RED/4.90, MOLHO TÁRTARO/4.90, SPICE HOT/4.90, ANGUS ESPECIAL/22.90, BOCA DE ANJO/22.90"}, 

  { Shopping_id:4, name:"Burger King", image_link:"card1.jpg", menu:"CRISPY CHICKEN/2.19, DOUBLE CHEESEBURGER/2.19, BIG KING/4.99, 2 WHOPPER/9.99, 6 CHILI CHEESE BITES/1.99, 2 CHICKEN ROYALE/9.99, 4 CHICKEN WINGS/1.79, 5 KING NUGGETS/2.49"},
  { Shopping_id:4, name:"McDonald's", image_link:"card2.jpg", menu:"MAHARAJA MAC/14.50, MAHARAJA MAC SPECIAL/14.50, BigSpicy Chicken Wrap/15.00, BigSpicy Paneer Wrap/15.00, McSpicy Chicken/11.80, BigSpicy Paneer/11.40, McChicken/8.10, McVeggie/7.00"}, 
  { Shopping_id:4, name:"Uata?!", image_link:"card3.jpg", menu:"UATATA SUPREMA/10.00, ESPETOS/10.00, UATA DOUBLE/15.00, UATA HEAD/12.00, UATA SHACK/15.00, UATA MIGNON/16.00, UATA CHICKEN/13.00"}, 
  { Shopping_id:4, name:"Divino Fogão",image_link:"card4.jpg", menu:"SOPA DE FEIJÃO/15.00, BIFE A FRANCESA/27.00, SUPREME DE FRANGO/27.00, FILÉ DE SALMÃO/32.00, CARPELETE DE CARNE/22.00, STROGONOFF DE FRANGO/27.00, OMELETE VEGETARIANO/21.00, FILÉ DE FRANGO GRELHADO/26.00, PICANHA GRELHADA/32.00, RISOTO DE FRANGO/24.00, PANQUECA DE CARNE/25.00, CONTRA FILÉ GRELHADO/32.00, FILÉ DE PEIXE GRATINADO/27.00"}, 
  { Shopping_id:4, name:"Lug's", image_link:"card5.jpg", menu:"SAUCE RED/4.90, MOLHO TÁRTARO/4.90, SPICE HOT/4.90, ANGUS ESPECIAL/22.90, BOCA DE ANJO/22.90"}, 

  { Shopping_id:5, name:"Burger King", image_link:"card1.jpg", menu:"CRISPY CHICKEN/2.19, DOUBLE CHEESEBURGER/2.19, BIG KING/4.99, 2 WHOPPER/9.99, 6 CHILI CHEESE BITES/1.99, 2 CHICKEN ROYALE/9.99, 4 CHICKEN WINGS/1.79, 5 KING NUGGETS/2.49"},
  { Shopping_id:5, name:"McDonald's", image_link:"card2.jpg", menu:"MAHARAJA MAC/14.50, MAHARAJA MAC SPECIAL/14.50, BigSpicy Chicken Wrap/15.00, BigSpicy Paneer Wrap/15.00, McSpicy Chicken/11.80, BigSpicy Paneer/11.40, McChicken/8.10, McVeggie/7.00"}, 
  { Shopping_id:5, name:"Uata?!", image_link:"card3.jpg", menu:"UATATA SUPREMA/10.00, ESPETOS/10.00, UATA DOUBLE/15.00, UATA HEAD/12.00, UATA SHACK/15.00, UATA MIGNON/16.00, UATA CHICKEN/13.00"}, 
  { Shopping_id:5, name:"Divino Fogão",image_link:"card4.jpg", menu:"SOPA DE FEIJÃO/15.00, BIFE A FRANCESA/27.00, SUPREME DE FRANGO/27.00, FILÉ DE SALMÃO/32.00, CARPELETE DE CARNE/22.00, STROGONOFF DE FRANGO/27.00, OMELETE VEGETARIANO/21.00, FILÉ DE FRANGO GRELHADO/26.00, PICANHA GRELHADA/32.00, RISOTO DE FRANGO/24.00, PANQUECA DE CARNE/25.00, CONTRA FILÉ GRELHADO/32.00, FILÉ DE PEIXE GRATINADO/27.00"}, 
  { Shopping_id:5, name:"Lug's", image_link:"card5.jpg", menu:"SAUCE RED/4.90, MOLHO TÁRTARO/4.90, SPICE HOT/4.90, ANGUS ESPECIAL/22.90, BOCA DE ANJO/22.90"}, 
  
  ]) if Rails.env.development?