import 'package:flutter/material.dart';
import 'dart:async';

enum DownloadState { get, loading, open }

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final List<DownloadState> _states =
      List.generate(10, (_) => DownloadState.get);

  void _onDownloadPressed(int index) {
    setState(() {
      _states[index] = DownloadState.loading;
    });

    // Simulate a download
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _states[index] = DownloadState.open;
      });
    });
  }

  Widget _buildDownloadButton(int index) {
    switch (_states[index]) {
      case DownloadState.get:
        return TextButton(
          onPressed: () => _onDownloadPressed(index),
          child: const Text("GET"),
        );
      case DownloadState.loading:
        return const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      case DownloadState.open:
        return TextButton(
          onPressed: () {},
          child: const Text("OPEN"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apps")),
      body: ListView.builder(
        itemCount: _states.length,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.ac_unit, color: Colors.white),
          ),
          title: Text("App ${index + 1}"),
          subtitle: const Text("Lorem ipsum..."),
          trailing: _buildDownloadButton(index),
        ),
      ),
    );
  }
}
