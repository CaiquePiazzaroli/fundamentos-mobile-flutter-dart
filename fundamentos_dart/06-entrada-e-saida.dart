
//Importando a blib
import 'dart:io';
void main() {
  // A entrada e saída de dados pode ser feita utilizando a biblioteca
  //dart:io, especialmente para programas que rodam no console.


  print("Digite o seu nome: ");
  String? nome = stdin.readLineSync(); //Le a entrada do usuário, o simbolo ? indica que o valor pode ser null
  print("Olá, ${nome}"); //Olá, $[nome digitado]


  print("Digite o sua idade: ");
  int? idade = int.parse(stdin.readLineSync()!); //converte para int, perceba o ! no final
  print("Você tem ${idade} anos!"); //Você tem ${idade} anos!
 }