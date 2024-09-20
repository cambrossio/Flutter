import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomBotton(
                icon: Icons.refresh_outlined,
                onPresed: () {
                  clickCounter = 0;
                  setState(() {});
                }),
            const SizedBox(height: 10),
            CustomBotton(
                icon: Icons.exposure_minus_1_outlined,
                onPresed: () {
                  if (clickCounter == 0) return;
                  clickCounter--;
                  setState(() {});
                }),
            const SizedBox(height: 10),
            CustomBotton(
                icon: Icons.plus_one,
                onPresed: () {
                  clickCounter++;
                  setState(() {});
                }),
          ],
        ));
  }
}

class CustomBotton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPresed;

  const CustomBotton({
    super.key,
    required this.icon,
    this.onPresed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(), //botones redondos
      onPressed: onPresed, //accion del boton
      child: Icon(icon), //tipo de icono del boton
    );
  }
}
