import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Искуство прекола - Анаконда')),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return ListTile(
                  title: Text('title'),
                );
              },
            ),
          ),
          AnimatedContainer(
            color: Colors.red,
            constraints: const BoxConstraints(maxHeight: 100),
            duration: const Duration(milliseconds: 500),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          )
        ],
      ),
    );
  }
}
