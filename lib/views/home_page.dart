import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/app_controller.dart';
import 'api_history_page.dart';
import 'progress_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showFeatureMessage(BuildContext context, String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$featureName masih dalam tahap pengembangan.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();

    final userName = controller.userEmail.isNotEmpty
        ? controller.userEmail.split('@').first
        : 'Lia';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F8),
      appBar: AppBar(
        title: const Text('LegalTrack'),
        backgroundColor: const Color(0xFF294BA6),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Hello, $userName 👋',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D2638),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCE8FF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Legal Progress',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'PT ABC',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '70% Completed',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 14),
                      LinearProgressIndicator(
                        value: 0.70,
                        minHeight: 10,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const ProgressPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF294BA6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'VIEW PROGRESS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D2638),
                  ),
                ),

                const SizedBox(height: 14),

                _serviceButton(
                  icon: Icons.upload_file,
                  label: 'Upload Docs',
                  onTap: controller.takeDocumentPhoto,
                ),

                const SizedBox(height: 10),

                _serviceButton(
                  icon: Icons.chat_outlined,
                  label: 'Chat Admin',
                  onTap: () {
                    showFeatureMessage(context, 'Chat Admin');
                  },
                ),

                const SizedBox(height: 10),

                _serviceButton(
                  icon: Icons.history,
                  label: 'History',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => const ApiHistoryPage(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                _serviceButton(
                  icon: Icons.support_agent,
                  label: 'Support',
                  onTap: () {
                    showFeatureMessage(context, 'Support');
                  },
                ),

                if (controller.capturedFileName != null) ...[
                  const SizedBox(height: 16),
                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: const Text('Dokumen berhasil dipilih'),
                      subtitle: Text(controller.capturedFileName!),
                    ),
                  ),
                ],

                if (controller.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    controller.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _serviceButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Align(alignment: Alignment.centerLeft, child: Text(label)),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF1D2638),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          side: const BorderSide(color: Color(0xFFE2E2E2)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
