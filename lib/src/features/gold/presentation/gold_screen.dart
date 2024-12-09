import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  // GOLD PRICE STREAM

  Stream<double> getGoldPriceStream() async* {
    await Future.delayed(Duration(seconds: 1));
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield 1800 + i * 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              Text('Live Kurs:',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),

              //Steam Builder

              Text(
                NumberFormat.simpleCurrency(locale: 'de_DE').format(goldPrice),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/bars.png'),
          width: 100,
        ),
        Text('Gold', style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
