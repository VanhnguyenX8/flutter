import 'package:counter_bloc/counter/handle.dart';
import 'package:counter_bloc/counter/view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit(),
    child: CounterView(),
    );
  }
}