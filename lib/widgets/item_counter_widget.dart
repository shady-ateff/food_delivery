import 'package:flutter/material.dart';

class ItemCounterWidget extends StatefulWidget {
  const ItemCounterWidget({super.key, required this.onCountChange});
  final void Function(int?) onCountChange;

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    debugPrint("counter Built");
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.2,
                child: ElevatedButton(
                  onPressed: _counter > 1
                      ? () {
                          setState(() {
                            _counter--;
                            widget.onCountChange(_counter);
                          });
                        }
                      : null,
                  child: const Icon(Icons.remove_rounded),
                ),
              ),
              Expanded(
                  child: Text(
                "$_counter",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: constraints.maxWidth * 0.07
                    ),
              )),
              SizedBox(
                width: constraints.maxWidth * 0.2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                      widget.onCountChange(_counter);
                    });
                  },
                  child: const Icon(Icons.add_rounded),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
