import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN OBTERTECNICA
Future<List<ObterTecnicaRow>> performObterTecnica(
  Database database,
) {
  final query = '''
select * from Tecnicas
''';
  return _readQuery(database, query, (d) => ObterTecnicaRow(d));
}

class ObterTecnicaRow extends SqliteRow {
  ObterTecnicaRow(Map<String, dynamic> data) : super(data);

  int? get id => data['Id'] as int?;
  String? get tecnica => data['Tecnica'] as String?;
  String? get grauDificuldade => data['GrauDificuldade'] as String?;
}

/// END OBTERTECNICA
