enum IngredientType {
  unknown(-1),
  juice(0),
  beer(1),
  wine(2),
  spirit(3),
  liqueur(4),
  soda(5),
  syrup(6);

  const IngredientType(this.value);
  final int value;
}

enum JuiceType {
  orangeJuice,
  appleJuice,
  pineappleJuice,
  grapeJuice,
  cranberryJuice,
  lemonJuice,
  limeJuice,
  grapefruitJuice,
  pomegranateJuice,
  peachJuice,
  mangoJuice,
  massionFruitJuice,
}

enum SpiritType {
  vodka,
  gin,
  rum,
  tequila,
  whiskey,
  bourbon,
  scotch,
  brandy,
  cognac,
  absinthe,
  schnapps,
  sambuca
}

enum BeerType {
  lager,
  ale,
  stout,
  pilsner,
  wheatBeer,
  sourBeer,
  porter,
  barleywine,
  bock,
  brownAle,
  creamAle
}

enum WineType {
  redWine,
  whiteWine,
  roseWine,
  sparklingWine,
  dessertWine,
  fortifiedWine,
  port,
  sherry,
  madeira,
  marsala,
  vermouth,
  sake,
}

enum LiqueurType {
  amaretto,
  baileys,
  cointreau,
  curacao,
  frangelico,
  grandMarnier,
  kahlua,
  midori,
  peachSchnapps,
  sloeGin,
  tripleSec,
  chambord,
}

enum SodaType {
  cola,
  lemonLime,
  rootBeer,
  gingerAle,
  orange,
  grape,
  strawberry,
  pineapple,
  cherry,
  blueberry,
  raspberry,
  blackberry,
}

enum SyrupType {
  strawberry,
  raspberry
}

class EnumUtils {
  static List<String> getNames(List<Enum> enumValues) {
    return enumValues
        .map<String>((e) =>
            e.name.split(RegExp('(?=[A-Z])')).join(' '),)
        .toList();
  }
}
