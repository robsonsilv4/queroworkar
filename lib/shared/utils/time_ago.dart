import 'package:intl/intl.dart';

String timeAgo(DateTime date, {DateTime? reference}) {
  reference ??= DateTime.now();
  final diff = reference.difference(date);
  if (diff.inSeconds < 60) {
    return Intl.plural(
      diff.inSeconds,
      zero: 'agora mesmo',
      one: 'há 1 segundo',
      other: 'há ${diff.inSeconds} segundos',
      name: 'secondsAgo',
      args: [diff.inSeconds],
    );
  } else if (diff.inMinutes < 60) {
    return Intl.plural(
      diff.inMinutes,
      one: 'há 1 minuto',
      other: 'há ${diff.inMinutes} minutos',
      name: 'minutesAgo',
      args: [diff.inMinutes],
    );
  } else if (diff.inHours < 24) {
    return Intl.plural(
      diff.inHours,
      one: 'há 1 hora',
      other: 'há ${diff.inHours} horas',
      name: 'hoursAgo',
      args: [diff.inHours],
    );
  } else if (diff.inDays < 7) {
    return Intl.plural(
      diff.inDays,
      one: 'há 1 dia',
      other: 'há ${diff.inDays} dias',
      name: 'daysAgo',
      args: [diff.inDays],
    );
  } else if (diff.inDays < 30) {
    final weeks = (diff.inDays / 7).floor();
    return Intl.plural(
      weeks,
      one: 'há 1 semana',
      other: 'há $weeks semanas',
      name: 'weeksAgo',
      args: [weeks],
    );
  } else if (diff.inDays < 365) {
    final months = (diff.inDays / 30).floor();
    return Intl.plural(
      months,
      one: 'há 1 mês',
      other: 'há $months meses',
      name: 'monthsAgo',
      args: [months],
    );
  } else {
    final years = (diff.inDays / 365).floor();
    return Intl.plural(
      years,
      one: 'há 1 ano',
      other: 'há $years anos',
      name: 'yearsAgo',
      args: [years],
    );
  }
}
