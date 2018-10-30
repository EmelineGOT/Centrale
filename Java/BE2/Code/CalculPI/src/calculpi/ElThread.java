/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculpi;
import static java.lang.Math.sqrt;
import java.util.Random;

/**
 *
 * @author Eloy
 */
public class ElThread implements Runnable{
    private int xl, yl, iter;
    private int Sum;

    
    ElThread(int a, int b, int it){
        xl=a;
        yl=b;
        iter=it;
        Sum=0;
    }
    @Override
    public void run() {
        Random r = new Random();
        double RandValX, RandValY, rayon;
        int i;
        for (i=0;i<iter;i++){
            RandValX=r.nextDouble()*xl;
            RandValY=r.nextDouble()*yl;
            rayon=sqrt(RandValX*RandValX+RandValY*RandValY);
            if(rayon<1){
                Sum+=1;
            }        
        }
    }

    public double getSum() {
        return Sum;
    }
    
    
}
