/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trifusion;

/**
 *
 * @author Emy
 */
public class Trieur extends Thread {

  private int[] t; // tableau à trier
  private int debut, fin; // tranche de ce tableau qu'il faut trier


Trieur(int[] t, int debut, int fin){
      this.t=t;
      this.debut=debut;
      this.fin=fin;
  }
  

  @Override
  public void run() {
    if (fin - debut < 2) {
      if (t[debut] > t[fin]) {
        echanger(debut, fin);
      }
    }
    else {
      int milieu = debut + (fin - debut) / 2;
      Trieur trieur1 = new Trieur(t, debut, milieu);
      trieur1.start();
      Trieur trieur2 = new Trieur(t, milieu + 1, fin);
      trieur2.start();
      try {
        trieur1.join();
        trieur2.join();
      }
      catch(InterruptedException e) {}
      triFusion(debut, fin);
    }
  }


  public void echanger(int i, int j) {
    int val = t[i];
    t[i] = t[j];
    t[j] = val;
  }

 
  public void triFusion(int debut, int fin) {
    int[] tab = new int[fin - debut + 1];  //tableau vide qui va contenir les tableaux triés fusionnés
    int milieu = (debut + fin) / 2; //valeur de l'indice du milieu du tableau
    int i1 = debut; //indice qui parcourt le premier tableau
    int i2 = milieu + 1; //indice qui parcourt le second tableau
    int indice = 0; //indice qui parcourt tab
    
    
    while (i1 <= milieu && i2 <= fin) {
      if (t[i1] < t[i2]) {
        tab[indice] = t[i1];
        indice+=1;
        i1+=1;
      }
      else {
        tab[indice] = t[i2]; 
        indice+=1;
        i2+=1;
      }
    }
    
    
    if (i1 > milieu) { //Si on a recopié l'intégralité du premier tableau
      for (int i = i2; i <= fin; ) {
        tab[indice] = t[i];
        indice+=1;
        i+=1;
      }
    }
    else { //Si on a recopié l'intégralité du second tableau
      for (int i = i1; i <= milieu; ) {
        tab[indice] = t[i];
        indice+=1;
        i+=1;
      }
    }
    
    
    for (int i = 0, j = debut; i <= fin - debut; ) {  //on recopie tab dans t
      t[j] = tab[i];
      j+=1;
      i+=1;
    }
  }
 
}
