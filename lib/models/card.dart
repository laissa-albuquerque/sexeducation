class CardOptionModel {
  late int opcao;
  String urlCard;
  bool selected;
  bool matched;

  CardOptionModel(
      {this.opcao = 0,
      required this.urlCard,
      required this.selected,
      required this.matched});


  @override
  String toString() {
    return 'CardOptionModel{opcao: $opcao, urlCard: $urlCard, selected: $selected, matched: $matched}';
  }
}
