import 'package:flutter/material.dart';
import '../constant.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nilai',
              style: TextStyle(color: neutral, fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              // ignore: sort_child_properties_last
              child: Text(
                '$result/$questionLength',
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              result == questionLength / 2
                  ? 'Hampir Berhasil'
                  : result < questionLength / 2
                      ? 'Coba Lagi?'
                      : 'Berhasil!',
              style: const TextStyle(color: neutral),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'Mulai Lagi',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
