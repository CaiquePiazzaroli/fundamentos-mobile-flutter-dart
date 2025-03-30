void main() {

  print(2*2); //4
  print(4/2); //2.0
  print(5~/2); //2 //Parte inteira
  print(2+2); //4
  print(2-2); //0
  print(5%2); //1
  print(2>3); //false
  print(2<3); //true
  
  var n1 = 2;
  print(n1++); //2
  print(++n1); //4
  print(n1--); //4
  print(--n1); //2


  var a = null;
  var b = "Caique";
  var c = "Outro valor";
  // o operador ?? retorna o primeiro valor válido
  print(a ?? c ?? b); //-> Outro valor

  //??= só faz atribuiçao da variavel que for null, ou seja, inválida
  a ??= 15; //A passa a ser 15
  b ??= "199"; //B continua sendo "Caique", pois o operador ??= só altera a vvariavel inválida
  c ??= "Outro valor 2"; //Outro valor




}