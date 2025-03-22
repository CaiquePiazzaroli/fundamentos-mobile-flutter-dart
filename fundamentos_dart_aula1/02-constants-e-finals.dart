void main(){
  //Declarando constrantes
  //Verficado em tempo de compilação
  const num PI = 3.14; //Variavel do tipo num (double ou int) constante 3.14
  //const DateTime dataDia = DateTime.now(); //não funciona - Error: Cannot invoke a non-'const' constructor where a const expression is expected.

  //Verificado em tempo de execução
  final DateTime dataHoje = DateTime.now(); //funcion;

  print(PI);
  print(dataHoje);

}



