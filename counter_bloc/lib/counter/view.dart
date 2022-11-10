import 'package:counter_bloc/counter/handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'counter app with bloc',
      )),
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(
            '$state',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('increment'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            key: const Key('decrement'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          )
        ],
      ),
    );
  }
}
