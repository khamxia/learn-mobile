
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PriceInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.currency(
    decimalDigits: 0,
    symbol: '',
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }
    final value = int.parse(digitsOnly);
    final newText = _formatter.format(value);
    final rawCursor = newValue.selection.baseOffset.clamp(0, newValue.text.length);
    int digitsBeforeCursor = 0;
    for (int i = 0; i < rawCursor; i++) {
      if (RegExp(r'\d').hasMatch(newValue.text[i])) digitsBeforeCursor++;
    }
    int newOffset = newText.length;
    int seen = 0;
    for (int i = 0; i < newText.length; i++) {
      if (seen == digitsBeforeCursor) {
        newOffset = i;
        break;
      }
      if (RegExp(r'\d').hasMatch(newText[i])) seen++;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newOffset),
    );
  }
}