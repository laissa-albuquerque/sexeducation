class CardOptionModel {
  bool canBeChosen;
  String urlCard;
  bool selected;
  bool matched;

  CardOptionModel(
      {required this.canBeChosen,
      required this.urlCard,
      required this.selected,
      required this.matched});

  @override
  String toString() {
    return 'CardOptionModel{canBeChosen: $canBeChosen, urlCard: $urlCard, selected: $selected, matched: $matched}';
  }
}
