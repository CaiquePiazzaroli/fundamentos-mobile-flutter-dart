void main() {

  //For comum
  for(var i = 0; i <= 10; i++) {
    print(i); //Imprime de 0 até 10
  }

  List alimentos = ["Banana", "Maça", "Goiaba"];
  for(var alimento in alimentos) {
    print(alimento); //Banana Maça Goiaba
  }

  //Utilizando o foreach
  alimentos.forEach((alimento) => print(alimento));

  //while
  num x = 0;
  while(x < 10) {
    print("X é igual a ${x}");
    x++;
  }


  //Do while
  num y = 0;
  do{
    print("Status do y: ${y}");
    y++;
  } while(y < 10);

}