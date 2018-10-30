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
public class TriFusion {

    public static void main(String[] args) {
    
    int[] t = {3,6,13,8,12,7,4,2};
    Trieur trieur = new Trieur(t,0,t.length-1);
    trieur.start();
    
    try {
      trieur.join();
    }
    
    catch(InterruptedException e) {}
    
    System.out.print("[");
    for (int i = 0; i <t.length-1; i++) {
      System.out.print(t[i] + " , ");
    }
    System.out.print(t[t.length-1]);
    System.out.print(" ] ");
    System.out.println();
  }

}
