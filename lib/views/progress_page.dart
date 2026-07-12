import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  Widget _progressItem({required String label, required bool completed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completed ? const Color(0xFF294BA6) : Colors.grey,
            size: 22,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: completed ? FontWeight.w600 : FontWeight.normal,
              color: const Color(0xFF1D2638),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F8),
      appBar: AppBar(
        title: const Text('Legal Progress'),
        backgroundColor: const Color(0xFFF8F5F8),
        foregroundColor: const Color(0xFF1D2638),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: 360,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PT ABC',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '70% Completed',
                  style: TextStyle(fontSize: 18, color: Color(0xFF1D2638)),
                ),
                const SizedBox(height: 18),

                const LinearProgressIndicator(
                  value: 0.70,
                  minHeight: 16,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                const SizedBox(height: 28),

                _progressItem(label: 'Consultation', completed: true),
                _progressItem(label: 'Document Upload', completed: true),
                _progressItem(label: 'Draft Deed', completed: true),
                _progressItem(label: 'Approval', completed: true),
                _progressItem(label: 'Akta & SK', completed: true),
                _progressItem(label: 'NPWP Process', completed: false),
                _progressItem(label: 'NIB / OSS', completed: false),
                _progressItem(label: 'Completed', completed: false),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Permintaan menghubungi admin telah dikirim.',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.chat_outlined),
                    label: const Text(
                      'CONTACT ADMIN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF294BA6),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
