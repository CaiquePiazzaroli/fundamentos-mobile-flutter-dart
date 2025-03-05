void main() {
  //Assim como no javascript, as funções no dart também sao de primeira classe

  //Função sem tipo de retorno
  minhafuncao1(){
    print("Sem retorno ");
  }

  minhafuncao1(); //Sem retorno 

  num minhafuncao2() {
    return 10;
  }

  print(minhafuncao2()); //10

  //Dart tambem funções podem ser passados como parametros
  imprime(String param) {
    print("ola " + param);
  }

  executa({required Function f, String n = "Anonimo"}){ 
    f(n);
  }

  executa(f: imprime, n: "Caique"); //ola, Caique

}