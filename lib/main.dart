import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLoC Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLoC Counter App'),
          centerTitle: true,
        ),

        body: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Counter Reset Successfully'),
                ),
              );
            }
          },

          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      'Counter Value',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      '${state.counter}',
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(
                          onPressed: state.counter == 10
                              ? null
                              : () {
                                  context
                                      .read<CounterBloc>()
                                      .add(Increment());
                                },
                          child: const Text('➕ Increment'),
                        ),

                        const SizedBox(width: 10),

                        ElevatedButton(
                          onPressed: state.counter == 0
                              ? null
                              : () {
                                  context
                                      .read<CounterBloc>()
                                      .add(Decrement());
                                },
                          child: const Text('➖ Decrement'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(Reset());
                      },
                      child: const Text('🔄 Reset'),
                    ),

                    const SizedBox(height: 30),

                    if (state.counter == 10)
                      const Text(
                        'Maximum limit reached',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}