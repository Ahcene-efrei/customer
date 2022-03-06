import 'package:customer/data/enums/genre.dart';
import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';

const ListHairType = [
  {'text':"1A", 'value':HairType.OneA, 'url':"lib/assets/images/hairType/A1.png"},
  {'text':"1B", 'value':HairType.OneB, 'url':"lib/assets/images/hairType/B1.png"},
  {'text':"1C", 'value':HairType.OneC, 'url':"lib/assets/images/hairType/C1.png"},
  {'text':"2A", 'value':HairType.TwoA, 'url':"lib/assets/images/hairType/A2.png"},
  {'text':"2B", 'value':HairType.TwoB, 'url':"lib/assets/images/hairType/B2.png"},
  {'text':"2C", 'value':HairType.TwoC, 'url':"lib/assets/images/hairType/C2.png"},
  {'text':"3A", 'value':HairType.ThreeA, 'url':"lib/assets/images/hairType/A3.png"},
  {'text':"3B", 'value':HairType.ThreeB, 'url':"lib/assets/images/hairType/B3.png"},
  {'text':"3C", 'value':HairType.ThreeC, 'url':"lib/assets/images/hairType/C3.png"},
  {'text':"4A", 'value':HairType.FourA, 'url':"lib/assets/images/hairType/A4.png"},
  {'text':"4B", 'value':HairType.FourB, 'url':"lib/assets/images/hairType/B4.png"},
  {'text':"4C", 'value':HairType.FourC, 'url':"lib/assets/images/hairType/C4.png"},
  {'text':"Aucun", 'value':HairType.Undefined, 'url':""},
];

const ListProductType = [
  {'text':"Haircut1", 'value':ProductType.Haircut1},
  {'text':"Haircut2", 'value':ProductType.Haircut2},
  {'text':"Haircut3", 'value':ProductType.Haircut3},
  {'text':"Haircut4", 'value':ProductType.Haircut4},
  {'text':"Shaving1", 'value':ProductType.Shaving1},
  {'text':"Shaving2", 'value':ProductType.Shaving2},
  {'text':"Shaving3", 'value':ProductType.Shaving3},
  {'text':"Shaving4", 'value':ProductType.Shaving4},
  {'text':"Shampoo", 'value':ProductType.Shampoo},
];

const ListGenre = [
  {'text':"Homme", 'value':Genre.Male},
  {'text':"Femme", 'value':Genre.Female},
  {'text':"Autre", 'value':Genre.Other},
  {'text':"Aucun", 'value':Genre.Undefined}
];