void main() {
  //Utiliza-se o try catch para tratar execoes
  try {
    print("Buscando api......");
  } on FormatException catch (fe) {
  print(fe);
  } on Exception catch (e) {
  print("Some other Exception: " + e);
  } catch (u) {
  print("Unknown exception");
  } finally {
  print("All done!");
  }

}