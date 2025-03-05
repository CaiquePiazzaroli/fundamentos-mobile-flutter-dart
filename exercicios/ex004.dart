// Escreva um programa em Dart para criar uma classe Camera com
// propriedades privadas [id, marca, cor, preço]. Crie métodos getter e setter
// para acessar e modificar os valores. Além disso, crie 3 objetos dela e
// imprima todos os detalhes.

class Camera {
  num _id;
  String _marca;
  String _cor;
  double _preco;

  Camera(this._id, this._marca, this._cor, this._preco);

  //Geters
  num getId() => this._id;
  String getMarca() => this._marca;
  String getCor() => this._cor;
  double getPreco() => this._preco;

  //Seters
  num setId(num id) => this._id = id;
  String setMarca(String marca) => this._marca = marca;
  String setCor(String cor) => this._cor = cor;
  double setPreco(double preco) => this._preco = preco;
}

void main() {
  Camera camera1 = new Camera(1, "Kodak", "Preto", 300);
  Camera camera2 = new Camera(2, "Tekpix", "Cinza", 1200);
  Camera camera3 = new Camera(3, "Sony", "Preto", 250);

  List cameras = [camera1, camera3, camera2];

  cameras.forEach((camera) => print("Marca: ${camera.getMarca()} - Preço: R\$${camera.getPreco()}"));

  //Operador casacata
  camera1
  ..setMarca("Kodak 2.0")
  ..setPreco(500);

  camera2
  ..setMarca("Tekpix 3.0 Idestrutível")
  ..setPreco(10000.00);

  camera3
  ..setMarca("Sony 3.0")
  ..setPreco(600);

  cameras.forEach((camera) => print("Marca: ${camera.getMarca()} - Preço: R\$${camera.getPreco()}"));

}