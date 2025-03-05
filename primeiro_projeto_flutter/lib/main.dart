//Importando um módulo do dart

//Importando um módulo qualquer externo
//import 'package:test/test.dart;

//Importando um arquivo qualquer
//import 'path/path1/myfile.dart'

//Criando uma classe
class Spacecraft {
  String name;
  DateTime? lauchDate;

  int? get launchYear => lauchDate?.year;

  //Construtor
  Spacecraft(this.name, this.lauchDate) {
    //Inicialização
  }

  //Construtor secundario
  Spacecraft.unlaunched(String name) : this(name, null);

  //Método
  void describe() {
    var lauchDate = this.lauchDate;
    if (lauchDate != null) {
      int years = DateTime.now().difference(lauchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print("unlaunched!");
    }
  }
}

void main() {
  //Exibindo no console
  print("História da Voyager 1");

  //Variáveis são de tipagem inplícita e utilizam a keyword var
  var name = "Voyager 1";
  var year = 1977;
  var antennaDiameter = 3.7;
  var flyByObjects = ["Jupiter", "Saturn", "Urane", "Nepturn"];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };

  //Controle de fluxo
  if (year >= 2001) {
    print("Laçada ao espaço no século 21");
  } else if (year >= 1901) {
    print("Lançada ao espaço no século 20");
  }

  //Estrutura de repetição com listas
  for (final planets in flyByObjects) {
    print(planets);
  }

  //Fluxo de repetição com contagem
  for (int meses = 1; meses <= 12; meses++) {
    print(meses);
  }

  //Fluxo de repetição condicional
  var count = 0;
  while (count <= 10) {
    print(count);
    count++;
  }

  //Declarando funções
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);
  print(result);

  //Declaração arrow para funções
  //flyByObject.where recebe uma função que filtra todos os valores que contem 'turn'
  //a função que ele recebe é uma arrow com a estrutura () => code
  flyByObjects.where((name) => name.contains("turn")).forEach(print);

  //Instanciando classes com o construtor principal
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  //Instanciando classes com o construtor secundário
  var voyager2 = Spacecraft.unlaunched("Voyager II");
  voyager2.describe();
}
