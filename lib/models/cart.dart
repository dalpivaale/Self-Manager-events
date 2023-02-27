import 'package:flutter/material.dart';

//THis class extends ChangeNotifier. It will act as data repository to be shared thorugh the application. 
//Sta classe maneggia lo stato dell'applicazione
class Cart extends ChangeNotifier{ //Provider approacher con sta classe notifichiamo i listeners

  //For simplicity, a product is just a String.
    int indice = 0; //All'inizio il nostro carrello è vuoto (è lo state dell'app)

  void addProduct(){ //ste metodo me lo sto inventando io!
    indice = indice +1; //aggiungiamo roba al carrello.
    //NB: se avessimo un database (tanta roba da aggiungere) al posto di una lista e dovessimo aspettare fai il solito await e async in  modo tale che l'app non attenda l'esecuzione del metodo
    //Call the notifyListeners() method to alert that something happened.Notifichiamo i listeners che lo state è cambiato
    notifyListeners();
  }//addProduct

  void clearCart(){ //metodo che definisco io cosa fa
    indice = 0;//Rimuoviamo tutti gli elementi dentro al carrello
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//clearCart
  
}//Cart