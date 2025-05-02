import 'dart:async';
import 'dart:math';

import 'package:crazy_granny/features/bar/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({
    super.key,
    required this.items,
    this.onInit,
    this.onCompleted,
  });

  final void Function(VoidCallback?)? onInit;
  final List<SlotItem> items;
  final void Function(List<List<SlotItem>>)? onCompleted;

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  final _functions = [];
  final List<List<SlotItem>> list = [];

  SlotItem? _item;
  int? _comb;

  @override
  void initState() {
    super.initState();
    widget.onInit?.call(_spin);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.r,
      height: 339.r + 300.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) {
            return _Reel(
              id: index,
              item: _item,
              comb: _comb,
              list: widget.items,
              onInit: (spin) => _functions.add(spin),
              onCompleted: (value) {
                list.add(value);
                if (index != 3) return;
                widget.onCompleted?.call(list);

                _item = null;
                _comb = null;
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }

  void _spin() {
    list.clear();
    for (var fun in _functions) {
      fun();
    }

    final temp = List.generate(2, (index) => Random().nextBool());
    final chance = temp.every((e) => e);

    if (!chance) return;

    final randIndex = Random().nextInt(widget.items.length - 2);
    _item = widget.items[randIndex];
    _comb = Random().nextInt(GameSlot.combinations.keys.length);
    setState(() {});
  }
}

class _Reel extends StatefulWidget {
  const _Reel({
    super.key,
    required this.id,
    this.onInit,
    required this.list,
    this.onCompleted,
    this.item,
    this.comb,
  });

  final int id;
  final SlotItem? item;
  final int? comb;
  final void Function(VoidCallback?)? onInit;
  final List<SlotItem> list;
  final void Function(List<SlotItem>)? onCompleted;

  @override
  State<_Reel> createState() => _ReelState();
}

class _ReelState extends State<_Reel> {
  final _controller = FixedExtentScrollController();
  final _list = <List<SlotItem>>[];
  Timer? timer;

  int _lastId = 0;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      final subList = _generateSublist();
      _list.add(subList);
    }

    widget.onInit?.call(_start);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.r,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 350.r,
        diameterRatio: 100,
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List.generate(
            _list.length,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5.r,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    _list[index].length,
                    (subIndex) {
                      final item = _list[index][subIndex];
                      if (item.isBig) {
                        return Image.asset(
                          item.asset,
                          errorBuilder: (ctx, error, stack) {
                            return Image.asset(
                              item.asset,
                              width: 65.r,
                              height: 140.r,
                              fit: BoxFit.fill,
                            );
                          },
                          width: 65.r,
                          height: 140.r,
                          fit: BoxFit.fill,
                        );
                      }
                      return Image.asset(
                        item.asset,
                        errorBuilder: (ctx, error, stack) {
                          return Image.asset(
                            item.asset,
                            width: 40.r,
                            height: 40.r,
                          );
                        },
                        width: 40.r,
                        height: 40.r,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _start() async {
    int counter = 0;
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      _controller.animateToItem(
        counter,
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      );
      counter--;
    });

    await Future.delayed(const Duration(seconds: 2));
    final result = await _stop();
    _lastId = result;
    widget.onCompleted?.call(_list[result]);
  }

  Future<int> _stop() async {
    timer?.cancel();
    int rand = Random().nextInt(_list.length);

    while (rand == _lastId) {
      rand = Random().nextInt(_list.length);
    }

    _list[rand] = _generateSublist(item: widget.item);
    setState(() {});

    await _controller.animateToItem(
      rand,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.decelerate,
    );

    return rand;
  }

  List<SlotItem> _generateSublist({SlotItem? item}) {
    final subList = <SlotItem>[];
    int count = 0;

    if (widget.comb != null && widget.item != null) {
      final comb = GameSlot.combinations.keys.toList()[widget.comb!];

      int empty = 0;
      for (int x = 0; x < comb.length; x++) {
        if (comb[x][widget.id] == 1) {
          empty = 0;
          count++;
          subList.add(widget.item!);
          continue;
        }

        final rand = Random().nextInt(widget.list.length - 2);
        final value = widget.list[rand];
        empty++;
        count += value.size;
        subList.add(value);

        if (empty < 3) continue;

        final big = List.generate(3, (index) => Random().nextBool());
        final allBig = big.every((e) => e);

        if (!allBig) {
          empty = 0;
          continue;
        }

        final randBig = Random().nextInt(2) + 9;
        subList.removeRange(subList.length - empty, subList.length);

        subList.addAll([widget.list[randBig]]);
        empty = 0;
      }

      return subList;
    }

    while (true) {
      final rand = Random().nextInt(widget.list.length);
      final value = widget.list[rand];
      if (count + value.size > 7) continue;
      count += value.size;
      subList.add(value);
      if (count == 7) break;
    }

    return subList;
  }
}
