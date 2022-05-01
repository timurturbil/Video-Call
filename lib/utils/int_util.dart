extension ExtendedInt on int {
  String get toMonthName {
    if (this == 1) {
      return "Ocak";
    } else if (this == 2) {
      return "Şubat";
    } else if (this == 3) {
      return "Mart";
    } else if (this == 4) {
      return "Nisan";
    } else if (this == 5) {
      return "Mayıs";
    } else if (this == 6) {
      return "Haziran";
    } else if (this == 7) {
      return "Temmuz";
    } else if (this == 8) {
      return "Ağustos";
    } else if (this == 9) {
      return "Eylül";
    } else if (this == 10) {
      return "Ekim";
    } else if (this == 11) {
      return "Kasım";
    } else if (this == 12) {
      return "Aralık";
    } else {
      return "";
    }
  }
}
