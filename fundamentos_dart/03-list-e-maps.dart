void main() {
  List lista = ["Macarrao", "Cebola", "Alho"];
  lista.add("Suco de uva"); //["Macarrao", "Cebola", "Alho", "Suco de uva"]
  lista[0] = "Garrafa de agua"; //["Garrafa de agua", "Cebola", "Alho", "Suco de uva"]
  lista.remove("Cebola");//["Garrafa de agua", "Alho", "Suco de uva"]
  lista.forEach((li) {
    print(li); //Garrafa de agua, Alho, Suco de uva
  });

  //Maps 
  Map notas = {"Marcio": 9.5, "Carla": 8.5, "Tereza": 10.0};
  print(notas["Marcio"]); //9.5
  notas.remove("Marcio"); //{"Carla": 8.5, "Tereza": 10.0};
  notas["Caique"] = 10.99;


  print(lista); //[Garrafa de agua, Alho, Suco de uva]
  print(notas); //{Carla: 8.5, Tereza: 10.0, Caique: 10.99}

}