import '../database.dart';

class ActivityLogsTable extends SupabaseTable<ActivityLogsRow> {
  @override
  String get tableName => 'activity_logs';

  @override
  ActivityLogsRow createRow(Map<String, dynamic> data) => ActivityLogsRow(data);
}

class ActivityLogsRow extends SupabaseDataRow {
  ActivityLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityLogsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get petId => getField<String>('pet_id');
  set petId(String? value) => setField<String>('pet_id', value);

  String? get activityType => getField<String>('activity_type');
  set activityType(String? value) => setField<String>('activity_type', value);

  String? get mood => getField<String>('mood');
  set mood(String? value) => setField<String>('mood', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime get dateLogged => getField<DateTime>('date_logged')!;
  set dateLogged(DateTime value) => setField<DateTime>('date_logged', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
