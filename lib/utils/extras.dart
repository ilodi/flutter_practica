class Extras {
  static String monthText(int month) {
    final months = [
      "Ene",
      "Feb",
      "Mar",
      "Abr",
      "May",
      "Jun",
      "Jul",
      "Ago",
      "Sep",
      "Oct",
      "Nov",
      "Dic"
    ];

    return months[month - 1];
  }

  static String fromNow(DateTime date) {
    final DateTime currentDate = DateTime.now();

    final int mins = currentDate.difference(date).inMinutes;
    if (mins < 60) {
      return "Hace $mins minutos";
    } else if (mins >= 60 && mins <= 60 * 23) {
      //ceils retorna el entero mas bajo de la divicion
      return "Hace ${(mins / 60).ceil()} Horas";
    } else if (mins > 60 * 23 && mins < 60 * 24 * 4) {
      return "Hace ${(mins / (60 * 24)).ceil()} Días";
    } else {
      return "${date.day} / ${monthText(date.month)} / ${date.year}";
    }
  }
}
