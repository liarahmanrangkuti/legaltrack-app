import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/app_controller.dart';

class ApiHistoryPage extends StatefulWidget {
  const ApiHistoryPage({super.key});

  @override
  State<ApiHistoryPage> createState() => _ApiHistoryPageState();
}

class _ApiHistoryPageState extends State<ApiHistoryPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = context.read<AppController>();

      if (controller.progressList.isEmpty) {
        controller.fetchProgress();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F8),
      appBar: AppBar(
        title: const Text('History Legalitas'),
        backgroundColor: const Color(0xFF294BA6),
        foregroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage != null &&
              controller.progressList.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 12),
                    Text(controller.errorMessage!, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.fetchProgress,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (controller.progressList.isEmpty) {
            return const Center(child: Text('Belum ada riwayat legalitas.'));
          }

          return RefreshIndicator(
            onRefresh: controller.fetchProgress,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.progressList.length,
              itemBuilder: (context, index) {
                final item = controller.progressList[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.companyName,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text('Klien: ${item.clientName}'),
                        const SizedBox(height: 3),
                        Text('Email: ${item.email}'),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: item.percentage / 100,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${item.percentage}% • ${item.status}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
