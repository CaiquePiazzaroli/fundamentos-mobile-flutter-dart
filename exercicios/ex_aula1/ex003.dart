// Escreva um programa em Dart para criar uma classe Animal com as
// propriedades [id, nome, cor]. Crie outra classe chamada Cat e a estenda de
// Animal. Adicione uma nova propriedade chamada som (do tipo String). Crie
// um objeto de Cat e imprima todos os detalhes.

class Animal {

  num _id;
  String _nome;
  String _cor;

  Animal(this._id, this._nome, this._cor);

}

class Cat extends Animal {
  Cat(super._id, super._nome, super.cor);
  void emitirSom() {
    print("Miau Miau");
  }
}

class Dog extends Animal {
  Dog(super._id, super._nome, super.cor);
  void emitirSom() {
    print("Au au");
  }
}

void main() {
  Cat cat = new Cat(1, "Gatinho Frajola", "Preto e Branco");
  Dog dog = new Dog(2, "Cachorro Caramelo", "Cor marrom caramelo");

  cat.emitirSom();
  dog.emitirSom();
}