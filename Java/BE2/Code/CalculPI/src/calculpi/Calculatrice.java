/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculpi;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eloy
 */
public class Calculatrice implements Runnable{
    private ArrayList<ElThread> LosZreds;
    private ArrayList<Thread> Zreds;
    private double suma=0;
    private int iter;
    
    Calculatrice(ArrayList<ElThread> Lista, ArrayList<Thread> Lista2,int it){
        LosZreds=Lista;
        Zreds=Lista2;
        iter=it;
    }
    
    public void run(){
        for(Thread Z:Zreds){
            try {
                Z.join();
            } catch (InterruptedException ex) {
                Logger.getLogger(Calculatrice.class.getName()).log(Level.SEVERE, null, ex);
            }
}
        for(ElThread Q:LosZreds){
            suma+=Q.getSum();
                }
    double picalc= (double) suma/iter;
    System.out.println(picalc);}
}
