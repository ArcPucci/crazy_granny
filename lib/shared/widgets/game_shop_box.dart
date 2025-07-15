import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../shared.dart';

class GameShopBox extends StatefulWidget {
  const GameShopBox({super.key});

  @override
  State<GameShopBox> createState() => _GameShopBoxState();
}

class _GameShopBoxState extends State<GameShopBox> {
  int _quantity = 0;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final iapConnection = InAppPurchase.instance;
  late List<PurchClassTotalCas> products;

  Future<void> _onPurchaseUpdate(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      await _handlePurchase(purchaseDetails);
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await iapConnection.completePurchase(purchaseDetails);
      buy();
      setState(() {});
    }
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  Future<void> loadPurchases() async {
    const Set<String> coins = {
      'com.example.crazyGranny_first_purchase',
      'com.example.crazyGranny_second_purchase',
      'com.example.crazyGranny_third_purchase',
    };
    final response = await iapConnection.queryProductDetails(coins);
    for (var element in response.notFoundIDs) {
      debugPrint('Purchase $element not found');
    }
    products =
        response.productDetails.map((e) => PurchClassTotalCas(e)).toList();
  }

  Future<void> buyLuckyAppsPurch(PurchClassTotalCas product) async {
    try {
      final iapConnectionFortune = InAppPurchase.instance;
      final newIAPpurchaseParam =
          PurchaseParam(productDetails: product.productDetails);
      await iapConnectionFortune.buyConsumable(
          purchaseParam: newIAPpurchaseParam);
    } catch (e) {
      debugPrint("ERROR: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
    );
    loadPurchases();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 322.w,
      height: 342.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 322.w,
              height: 288.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/frames/frame3.png'),
                  fit: BoxFit.fill,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: ListView.builder(
                itemCount: GameShop.gameCurrencies.length,
                itemBuilder: (context, index) {
                  final currency = GameShop.gameCurrencies[index];
                  return GameButtonsShopCard(
                    quantity: currency.quantityString,
                    buttonText: '${currency.priceString} \$',
                    bestPrice: currency.bestPrice,
                    onTap: () async {
                      _quantity = currency.quantity;
                      try {
                        await buyLuckyAppsPurch(products[index]);
                      } catch (e) {
                        debugPrint("Ошибка покупки: $e");
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 149.w,
              height: 42.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/frames/frame2.png'),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              child: CustomStrokeText(
                text: 'BUTTONS',
                textStyle: AppTextStyles.no28,
                strokeColor: AppColors.purple1,
                strokeWidth: 3.sp,
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            right: 0,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/png/cross.png',
                width: 17.w,
                height: 17.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buy() {
    final provider = Provider.of<AppDataProvider>(
      context,
      listen: false,
    );

    provider.addButtons(_quantity);
  }
}
