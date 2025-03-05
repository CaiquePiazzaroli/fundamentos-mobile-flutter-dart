void main() {
  ola() => print("Ola arrow");
  ola(); //Ola

  //retornando uma arrow funcion em uma função
  remember(int inNumber) {
    return () => print(inNumber); //Retorno do tipo function
  }

  Function f = remember(10);
  f(); // -> 10;

}

