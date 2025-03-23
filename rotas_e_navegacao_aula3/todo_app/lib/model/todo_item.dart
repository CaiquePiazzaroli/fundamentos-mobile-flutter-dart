
class TodoItem {
  late final String _title; //Privado
  late final String _description; //Privado

  //Construtor
  TodoItem({required String title, required String description}){
      _title = title;
      _description = description;
  }

  String get title => _title;
  String get description => _description;
}