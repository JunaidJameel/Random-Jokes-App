extension StringCasingExtension on String {
  String capitalizeFirst() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
