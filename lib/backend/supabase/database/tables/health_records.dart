import '../database.dart';

class HealthRecordsTable extends SupabaseTable<HealthRecordsRow> {
  @override
  String get tableName => 'health_records';

  @override
  HealthRecordsRow createRow(Map<String, dynamic> data) =>
      HealthRecordsRow(data);
}

class HealthRecordsRow extends SupabaseDataRow {
  HealthRecordsRow(super.data);

  @override
  SupabaseTable get table => HealthRecordsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get petId => getField<String>('pet_id');
  set petId(String? value) => setField<String>('pet_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get dateGiven => getField<DateTime>('date_given');
  set dateGiven(DateTime? value) => setField<DateTime>('date_given', value);

  DateTime? get nextDueDate => getField<DateTime>('next_due_date');
  set nextDueDate(DateTime? value) =>
      setField<DateTime>('next_due_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
