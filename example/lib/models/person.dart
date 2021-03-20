class Person {
  final String name;
  DateTime? birthMonth;
  bool? isSingle;
  List<String> favoriteAnimes = [];
  String? favoriteCharacter;

  Person(this.name);

  @override
  String toString() {
    return 'Name: $name - Birth month: ${birthMonth?.month} - Is single: $isSingle - Favorite animes: $favoriteAnimes - Favorite character: $favoriteCharacter';
  }
}
