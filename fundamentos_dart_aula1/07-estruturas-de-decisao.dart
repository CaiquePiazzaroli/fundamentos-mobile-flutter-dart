void main() {
  double nota = 4;
  if(nota >= 9.0) {
    print("Muito bommm");
  } else if(nota >= 5.0) {
    print("Pasouu!");
  } else {
    print("Repetiu de ano!");
  }

  int panetones = 10;
  switch(panetones) {
    case 10:
      print("Estoque cheio!");
      break;
    case 5: 
      print("Utilizando estoque de segurança!");
      break;
    case 0: 
      print("Sem estoque!");
      break;
    default:
      print("Valor em estoque: ${panetones}");
      break;
  }



}