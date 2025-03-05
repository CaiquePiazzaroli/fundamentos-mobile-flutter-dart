//Definindo uma classe
class Product {
  //Atributos com nível de privacidade privada
  int _id;
  String _title;
  bool _active;
  double _price;
  static String descricao = "Ola, eu sou um produto"; //Campo estático pode ser utilizado sem declara o objeto

  //Definição de função via construtor sem corpo
  Product(this._id, this._title, this._active, this._price);

  //Definição com corpo
  // Product(int id, String title, bool active, double price) {
  //   this._id = id;
  //   this._title = title;
  //   this._active = active;
  //   this._price = price;
  // }

  //Definição de metodos via getter
  int get id => _id;

  double get price => _price;

  bool get active => _active;

  String get title => _title;
}

class ShoppingCart {

  List<Product> _products = []; //Atributo products que é uma lista de produtos!
  List<Product> get products => this._products; //Get para o atributo products

  void addItem(Product prod) {
    this.products.add(prod); //Adiciona um produto ao carrinho
  }

  double total() {
    double total = 0;

    products.forEach((Product p ) {
      total += p.price;
    });

    return total;
  }

}


//->>>. Orientação a objetos
//Classe abstrata
abstract class Humano {
  apresentar();

  void descreverComEnfase() {
    print("==========");
    apresentar();
    print("==========");
  }
}

//Pessoa implementa Humano, logo é obrigatório atender a certos requisitos
class Pessoa implements Humano {
  int idade;
  String nome;
  //Indica que a propriedade atlura não é obrigatória
  String? altura;

  //Construtor principal, obrigatório receber o altura
  Pessoa(this.idade, this.nome, this.altura) {
    //aaa
  }

  //Construtor secundário, altura não obrigatório
  Pessoa.semAltura(int idade, String nome) : this(idade, nome, null);

  @override
  void apresentar() {
    if(altura != null) {
      print("Nome: $nome \nIdade: $idade \nAltura: $altura");

    } else {
      print("Nome: $nome \nIdade: $idade");
    }
  }
  
  //Aqui 
  @override
  void descreverComEnfase() {
    print("==========");
    apresentar();
    print("==========");
  }

}

//O aluno extende pessoa
class Aluno extends Pessoa{
  String prontuario;

  //Construtor 
  Aluno(super.idade, super.nome, super.altura, this.prontuario);

  //Polimorfismo do metodo apresentar()
  @override
  void apresentar() {
    print("Sou aluno do instituto, me chamo $nome tenho $idade anos, $altura m e prontuario $prontuario");
  }
}


//Outros exemplos 
//Superclasse
class Hero {
  String firstName;
  String lastName;
  Hero.build(this.firstName, this.lastName); //Define como os atributos serao passados para a classe filha
  String sayName() {
  return "$lastName, $firstName";
  }
}

class UltimateHero extends Hero {

  UltimateHero(fn, ln) : super.build(fn, ln); //Classe filha recebendo os atributos da classe pai

  String sayName() {
    return "Jedi $lastName, $firstName";
  } 
}

void main() {

  print(Product.descricao);

  Product p1  = new Product(1, "Melancia", true, 144.5);
  Product p2  = new Product(3, "Mamao", true, 10.5);
  ShoppingCart carrinho = new ShoppingCart();
  carrinho.addItem(p1);
  carrinho.addItem(p2);

  carrinho.products.forEach((Product p) { //Imprimindo os itens na tela
    print(p._title);
  });

  print(carrinho.total()); //Soma dos preços dos produtos



  //Herança e polimorfismo
  var pessoa = Pessoa.semAltura(16, "Jhonatan");
  pessoa.apresentar();

  var pessoaComAltura = Pessoa(17, "Manoel", "1,7");
  pessoaComAltura.apresentar();

  var aluno = Aluno(19, "Caique", "1.65","bp123145x");
  aluno.apresentar();
  aluno.descreverComEnfase();


}