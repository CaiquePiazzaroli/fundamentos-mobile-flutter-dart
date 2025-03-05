
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




void main() {
  var pessoa = Pessoa.semAltura(16, "Jhonatan");
  pessoa.apresentar();

  var pessoaComAltura = Pessoa(17, "Manoel", "1,7");
  pessoaComAltura.apresentar();

  var aluno = Aluno(19, "Caique", "1.65","bp123145x");
  aluno.apresentar();
  aluno.descreverComEnfase();
}