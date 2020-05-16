class Person {
  final String name;
  DateTime birthMonth;
  bool isSingle;
  String favoriteAnime;
  String favoriteCharacter;

  Person(this.name);

  @override
  String toString() {
    return 'Name: $name - Birth month: ${birthMonth?.month} - Is single: $isSingle - Favorite anime: $favoriteAnime - Favorite character: $favoriteCharacter';
  }
}
