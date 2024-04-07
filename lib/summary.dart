import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...summaryData.map(
            (answer) => Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: (answer['selected_answer'] ==
                              answer['correct_answer'])
                          ? Colors.blueAccent
                          : Colors.red[300],
                      foregroundColor: Colors.white,
                      child: Text(
                          ((answer['question_index'] as int) + 1).toString()),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            answer['question'].toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 250, 205, 254),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            answer['selected_answer'].toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(146, 250, 205, 254),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            answer['correct_answer'].toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 49, 167, 203),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
