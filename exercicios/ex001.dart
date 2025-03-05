// screva um programa em Dart para criar uma classe Laptop com as
// propriedades [id, nome, ram] e crie 3 objetos dela, imprimindo todos os
// detalhes

class Laptop {

  int id;
  String nome;
  int ram;

  Laptop(this.id, this.nome, this.ram);

  int getId() => this.id;
  String getNome() => this.nome;
  int getRam() => this.ram;

}

void main() {

 
  var l1 = Laptop(1, "Laptop do caique", 8);
  var l2 = Laptop(2, "Laptop do Joao", 16);
  var l3 = Laptop(3, "Laptop da Maria", 32);

  List listaLaptops = [l1, l2, l3];

  listaLaptops.forEach((lap) => print("Nome: ${lap.nome} - id: ${lap.id} - ram: ${lap.ram}"));


}