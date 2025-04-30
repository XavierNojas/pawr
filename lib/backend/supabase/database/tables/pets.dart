import '../database.dart';

class PetsTable extends SupabaseTable<PetsRow> {
  @override
  String get tableName => 'pets';

  @override
  PetsRow createRow(Map<String, dynamic> data) => PetsRow(data);
}

class PetsRow extends SupabaseDataRow {
  PetsRow(super.data);

  @override
  SupabaseTable get table => PetsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get breed => getField<String>('breed');
  set breed(String? value) => setField<String>('breed', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
