import 'package:customer/data/models/Hairdresser.dart';
import 'package:customer/data/models/Product.dart';

const List TypeOfLocation = ["A domicile", "En Salon"];
const List peopleFeedback = [
  "Fast & reliable (12)",
  "Well packed (11)",
  "Follow order notes (11)"
];
const List categories = [
  {"img": "lib/assets/images/discount.svg", "name": "Réductions"},
  {"img": "lib/assets/images/deals.svg", "name": "Offres"},
  {"img": "lib/assets/images/pickup.svg", "name": "Coupes"},
  {"img": "lib/assets/images/groceries.svg", "name": "Barbes"},
  {"img": "lib/assets/images/essentials.svg", "name": "Specials"},
  {"img": "lib/assets/images/fruit.svg", "name": "Soins"},
  {"img": "lib/assets/images/alcohols.svg", "name": "Services"},
];
const List firstMenu = [
  {
    "img":
        "https://cdn.pixabay.com/photo/2020/03/31/01/58/no-shave-4985994_960_720.png",
    "is_liked": true,
    "name": "Johnny's BarberShop",
    "description": "Coupes Hommes - Barbes - Précision",
    "time": "25-35 Min",
    "delivery_fee": "\$1.49 Déplacement"
  }
];

List<Hairdresser> listOfHairdresser = [
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),
  Hairdresser(firstname: "firstname"), Hairdresser(firstname: "firstname"),


];

List<Product> products = [
  Product(name: "coupe homme", price: 10.50),
  Product(name: "coupe femme", price: 33.99),
  Product(name: "coupe simple", price: 17.99),
];
const List exploreMenu = [
  {
    "img":
        "https://cdn.pixabay.com/photo/2019/12/06/05/59/bridal-4676681_960_720.jpg",
    "is_liked": true,
    "name": "Dunkin' (122 Fulton St)",
    "description": "Mariages - Anniversaires - Maquillages",
    "time": "15-25 Min",
    "delivery_fee": "\$1.00 Delivery Fee",
    "rate": "4.5",
    "rate_number": "(105)"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": false,
    "name": "McDonald's - LES (Delancey St)",
    "description": "American - Fast Food - Burgers",
    "time": "20-30 Min",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.5",
    "rate_number": "500+"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": true,
    "name": "Subway (30 BROAD ST)",
    "description": "Fast Food - Sandwich - American",
    "time": "40-50 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.5",
    "rate_number": "133"
  },
];

const List popluarNearYou = [
  {
    "img":
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": false,
    "name": "Village Breakfast Snob",
    "description": "Breakfast and Brunch - American - Sandwich",
    "time": "20-30 Min",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": false,
    "name": "Soho Finest Market",
    "description": "Breakfast aand Brunch - Juice and Smoothies",
    "time": "15-25 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.4",
    "rate_number": "22"
  },
];

const List packForYou = [
  {
    "img":
        "https://images.unsplash.com/photo-1559847844-5315695dadae?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1940&q=80",
    "name": "The Bacon, Egg, and Cheese Bagel",
    "description":
        'Fresh eggs, bacon, and creamy cheese stuffed and between a begel...',
    "price": "\$ 11.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1527324688151-0e627063f2b1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8&auto=format&fit=crop&w=800&q=60",
    "name": "Original French Toast",
    "description":
        'Sliced challah bread soaked in eggs and milk, then fried serve with a good...',
    "price": "\$ 9.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1557079604-d28080618be0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8&auto=format&fit=crop&w=800&q=60",
    "name": "Spanish Omelette",
    "description":
        'French eggs, tomatoes, onions, and peppers, creamy cheese, and salads...',
    "price": "\$ 13.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1557499305-87bd9049ec2d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8&auto=format&fit=crop&w=800&q=60",
    "name": "2 Eggs Served with Home Fries and Toast",
    "description":
        '2 eggs served your way with home fries and hot toast. Choicee of add...',
    "price": "\$ 10.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1580476262798-bddd9f4b7369?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    "name": "The Bacon Egg, and Cheese Sandwich",
    "description":
        'Fresh eggs, bacon, and creamy cheese stuffed in between sandwich...',
    "price": "\$ 11.99"
  }
];
