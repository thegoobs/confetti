import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:confetti/confetti.dart';

void main() {
  test('renders with default values', () {
    final confetti = Confetti(child: Text('we made it!'));
    expect(confetti.child, 'we made it!');
  });
}