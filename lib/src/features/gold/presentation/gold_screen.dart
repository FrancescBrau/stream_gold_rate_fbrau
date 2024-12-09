import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  // GOLD PRICE STREAM

  Stream<double> getGoldPriceStream() async* {
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 2));
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

              StreamBuilder<double>(
                  stream: getGoldPriceStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error loading price');
                    } else if (snapshot.hasData) {
                      return Text(NumberFormat.simpleCurrency(locale: 'eu_EU')
                          .format(snapshot.data));
                    } else {
                      return Text('Data not found.');
                    }
                  }),
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
