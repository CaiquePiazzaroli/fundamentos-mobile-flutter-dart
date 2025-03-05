// Escreva um programa em Dart para criar uma classe House com as
// propriedades [id, nome, preço]. Crie um construtor para ela e crie 3 
// objetos. Adicione-os a uma lista e imprima todos os detalhes.

class House {

  int id;
  String nome;
  double preco;

  House(this.id, this.nome, this.preco);

  int getId() => this.id;
  String getNome() => this.nome;
  double getPreco() => this.preco;

}

void main() {

 
  var c1 = House(1, "Casa na praia", 300000.00);
  var c2 = House(2, "Casa no centro", 250000.00);
  var c3 = House(3, "Casa no sítio", 150000.00);

  List casas = [c1, c2, c3];

  casas.forEach((casa) => print("Nome: ${casa.getNome()} - id: ${casa.getId()} - Preço: R\$${casa.getPreco()}"));


}