/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculpi;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Eloy
 */
public class CalculPI {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int itera=10000;
        
        ArrayList<Thread> quadrants= new ArrayList();
        ArrayList<ElThread> losthreads= new ArrayList();

        ElThread Thr1 = new ElThread(1,1,itera);
        ElThread Thr2 = new ElThread(-1,1,itera);
        ElThread Thr3 = new ElThread(-1,-1,itera);
        ElThread Thr4 = new ElThread(1,-1,itera);
        
        losthreads.add(Thr1);
        losthreads.add(Thr2);
        losthreads.add(Thr3);
        losthreads.add(Thr4);
        
        quadrants.add(new Thread(Thr1));
        quadrants.add(new Thread(Thr2));
        quadrants.add(new Thread(Thr3));
        quadrants.add(new Thread(Thr4));
        
        for(Thread q : quadrants){
            q.start();
        }
        Thread calculer;
        Calculatrice calcu;
        calcu=new Calculatrice(losthreads,quadrants, itera);
        
        calculer= new Thread(calcu);
        calculer.start();
            }
        
    }  