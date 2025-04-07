void main() {
  //Definir variaveis com var ou com o tipo específico
  //impedem mudança de tipo ao decorrer da execução do código

  var num = 1; //Atribuindo uma variavel com var
  print(1);
  // num = "Olá"; //Error: A value of type 'String' can't be assigned to a variable of type 'int'

  String nome = "Caique Mendes";
  print(nome);
  //nome = 10;  //Error: A value of type 'int' can't be assigned to a variable of type 'String'.

  dynamic qualquerTipo = "Caique Mendes dynamic";
  print(qualquerTipo); //Caique Mendes dynamic
  qualquerTipo = 19;
  print(qualquerTipo); //19

  print("Checagem de tipo!");
  print(num is String); //False
  print(num is int); //True
  //print(num as String); // type 'int' is not a subtype of type 'String' in type cast

}