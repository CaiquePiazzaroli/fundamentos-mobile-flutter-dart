class Aluno {

  double n1 = 0;
  double n2 = 0; 
  double n3 = 0; //3 atributos

  Aluno.AlunoSemNota() {}

  Aluno(double nota1, double nota2, double nota3) {
    //Atribuição em cascata
    this 
    ..n1 = nota1 //Mesmo que: this.n1 = nota1
    ..n2 = nota2 //Mesmo que: this.n2 = nota2
    ..n3 = nota3; //Mesmo que: this.n3 = nota3
  }

  double getn1(){
    return this.n1;
  }

  double getn2(){
    return this.n2;
  }

  double getn3(){
    return this.n3;
  }

  void setn1(double n){
    this.n1 = n;
  }

  void setn2(double n){
    this.n2 = n;
  }

  void setn3(double n){
     this.n3 = n;
  }

}


void main() {
  //Uma maneira de atribuir valores de maneira mais rápida para um classe
  // Quando operações seguidas são relativas a um mesmo objeto
  Aluno a1 = Aluno.AlunoSemNota();
  a1
  ..setn1(10.0) //mesmo que: a1.setn1(10.0)
  ..setn2(9.0) //mesmo que: a1.setn2(9.0)
  ..setn3(8.8); //mesmo que: a1.setn2(8.8)

  print("${a1.getn1()} - ${a1.getn2()} - ${a1.getn3()}"); //10.0 - 9.0 - 8.8
}