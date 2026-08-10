import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Premium Counter',
      theme: ThemeData(
        useMaterial3: true,
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
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF24124D),
              Color(0xFF4B2785),
              Color(0xFFEDE7F6),
            ],
            stops: [0.0, 0.45, 1.0],
          ),
        ),
        child: SafeArea(
          child: BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.count == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text('Counter reset successfully'),
                      ],
                    ),
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              }
            },
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                final count = state.count;
                final progress = count / 10;

                return Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 460,
                      ),
                      child: Column(
                        children: [
                          // ==========================
                          // TOP HEADER
                          // ==========================

                          Row(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.16),
                                  borderRadius:
                                      BorderRadius.circular(17),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.25),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.auto_graph_rounded,
                                  color: Colors.white,
                                  size: 29,
                                ),
                              ),

                              const SizedBox(width: 14),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Counter Studio',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'BLoC State Management',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.13),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.greenAccent,
                                      size: 9,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'LIVE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 28),

                          // ==========================
                          // MAIN WHITE CARD
                          // ==========================

                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.18),
                                  blurRadius: 35,
                                  offset: const Offset(0, 18),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Small title
                                const Text(
                                  'CURRENT VALUE',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),

                                const SizedBox(height: 22),

                                // ========================
                                // CIRCULAR COUNTER
                                // ========================

                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 225,
                                      height: 225,
                                      child: CircularProgressIndicator(
                                        value: progress,
                                        strokeWidth: 11,
                                        backgroundColor:
                                            const Color(0xFFEDE8F8),
                                        valueColor:
                                            const AlwaysStoppedAnimation(
                                          Color(0xFF7653D6),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: 190,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF8C62E8),
                                            Color(0xFF5630A6),
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFF7653D6)
                                                .withOpacity(0.35),
                                            blurRadius: 28,
                                            spreadRadius: 3,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$count',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 65,
                                              fontWeight: FontWeight.bold,
                                              height: 1,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'COUNTS',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                              letterSpacing: 3,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // Limit
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Progress',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '$count / 10',
                                      style: const TextStyle(
                                        color: Color(0xFF5D3CA8),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                // Progress bar
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: 8,
                                    backgroundColor:
                                        const Color(0xFFECE8F5),
                                    color: const Color(0xFF7653D6),
                                  ),
                                ),

                                const SizedBox(height: 22),

                                // Status
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: count == 10
                                        ? const Color(0xFFFFF2D8)
                                        : const Color(0xFFE9F8EF),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        count == 10
                                            ? Icons.warning_amber_rounded
                                            : Icons.check_circle_rounded,
                                        size: 19,
                                        color: count == 10
                                            ? Colors.orange.shade700
                                            : Colors.green.shade600,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        count == 10
                                            ? 'Maximum limit reached'
                                            : 'Counter is active',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: count == 10
                                              ? Colors.orange.shade800
                                              : Colors.green.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ==========================
                          // CONTROL CARD
                          // ==========================

                          Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.94),
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _ControlButton(
                                    icon: Icons.remove_rounded,
                                    title: 'Decrease',
                                    subtitle: '− 1',
                                    enabled: count > 0,
                                    filled: false,
                                    onTap: () {
                                      context
                                          .read<CounterBloc>()
                                          .add(Decrement());
                                    },
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: _ControlButton(
                                    icon: Icons.add_rounded,
                                    title: 'Increase',
                                    subtitle: '+ 1',
                                    enabled: count < 10,
                                    filled: true,
                                    onTap: () {
                                      context
                                          .read<CounterBloc>()
                                          .add(Increment());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 14),

                          // ==========================
                          // RESET
                          // ==========================

                          SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                context
                                    .read<CounterBloc>()
                                    .add(Reset());
                              },
                              icon: const Icon(
                                Icons.refresh_rounded,
                              ),
                              label: const Text(
                                'RESET COUNTER',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF27213D),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          // ==========================
                          // BLOC FLOW
                          // ==========================

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.82),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'HOW BLoC WORKS',
                                  style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    _Flow(
                                      icon: Icons.touch_app_rounded,
                                      title: 'UI',
                                    ),
                                    _Arrow(),
                                    _Flow(
                                      icon: Icons.bolt_rounded,
                                      title: 'Event',
                                    ),
                                    _Arrow(),
                                    _Flow(
                                      icon: Icons.memory_rounded,
                                      title: 'BLoC',
                                    ),
                                    _Arrow(),
                                    _Flow(
                                      icon: Icons.layers_rounded,
                                      title: 'State',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            'Flutter  •  BLoC  •  Counter Assignment',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// CONTROL BUTTON
// ======================================================

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool enabled;
  final bool filled;
  final VoidCallback onTap;

  const _ControlButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.enabled,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: filled
              ? const Color(0xFF7653D6)
              : const Color(0xFFF0EBF8),
          foregroundColor:
              filled ? Colors.white : const Color(0xFF5D3CA8),
          disabledBackgroundColor: Colors.grey.shade200,
          disabledForegroundColor: Colors.grey.shade400,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 22),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: filled
                    ? Colors.white70
                    : const Color(0xFF8D7DAA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// FLOW ITEM
// ======================================================

class _Flow extends StatelessWidget {
  final IconData icon;
  final String title;

  const _Flow({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF7653D6),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_forward_rounded,
      size: 17,
      color: Colors.black26,
    );
  }
}