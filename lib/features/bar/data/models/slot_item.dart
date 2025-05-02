abstract class SlotItem {
  final bool isBig;
  final String asset;

  int get size => isBig ? 3 : 1;

  SlotItem({this.isBig = false, required this.asset});

  @override
  bool operator ==(Object other) {
    return other is SlotItem &&
        other.runtimeType == runtimeType &&
        other.asset == asset &&
        other.isBig == isBig;
  }

  @override
  int get hashCode => Object.hash(runtimeType, asset, isBig);
}

class BlueButton extends SlotItem {
  BlueButton({super.asset = 'assets/png/slot/item2.png'});
}

class PurpleButton extends SlotItem {
  PurpleButton({super.asset = 'assets/png/button.png'});
}

class RedButton extends SlotItem {
  RedButton({super.asset = 'assets/png/slot/item1.png'});
}

class YellowButton extends SlotItem {
  YellowButton({super.asset = 'assets/png/slot/item3.png'});
}

class GreenButton extends SlotItem {
  GreenButton({super.asset = 'assets/png/slot/item4.png'});
}

class Flower extends SlotItem {
  Flower({super.asset = 'assets/images/flower.png'});
}

class Needle extends SlotItem {
  Needle({super.asset = 'assets/images/needle.png'});
}

class Shoes extends SlotItem {
  Shoes({super.asset = 'assets/images/shoes.png'});
}

class Books extends SlotItem {
  Books({super.asset = 'assets/images/book.png'});
}

class WildItem extends SlotItem {
  WildItem({super.asset = 'assets/png/slot/item5.png', super.isBig = true});
}

class ScatterItem extends SlotItem {
  ScatterItem({super.asset = 'assets/png/slot/item6.png', super.isBig = true});
}

class EmptyCell extends SlotItem {
  EmptyCell({super.asset = ''});
}
