class Liquid {
  final int id;
  final String asset;
  final double width;
  final double height;

  Liquid({
    required this.id,
    required this.asset,
    required this.width,
    required this.height,
  });
}

class LongLiquid extends Liquid {
  LongLiquid({
    super.id = 0,
    super.asset = 'assets/png/liquid.png',
    super.width = 48,
    super.height = 1793,
  });
}

class ShortLiquid extends Liquid {
  ShortLiquid({
    super.id = 0,
    super.asset = 'assets/png/liquid2.png',
    super.width = 45,
    super.height = 1332,
  });
}
