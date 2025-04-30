import '../database.dart';

class RemindersTable extends SupabaseTable<RemindersRow> {
  @override
  String get tableName => 'reminders';

  @override
  RemindersRow createRow(Map<String, dynamic> data) => RemindersRow(data);
}

class RemindersRow extends SupabaseDataRow {
  RemindersRow(super.data);

  @override
  SupabaseTable get table => RemindersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get petId => getField<String>('pet_id');
  set petId(String? value) => setField<String>('pet_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get reminderDate => getField<DateTime>('reminder_date')!;
  set reminderDate(DateTime value) =>
      setField<DateTime>('reminder_date', value);

  bool? get repeat => getField<bool>('repeat');
  set repeat(bool? value) => setField<bool>('repeat', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
