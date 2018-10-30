package testswing3;

import javax.swing.JFrame;

public class TestSwing3 {

    public static void main(String[] args) {
        JFrame f = new JFrame("Dessin");
        f.setSize(500, 500);
        Dessin d = new Dessin();
        f.setContentPane(d);
        Traitement t = new Traitement(d);
        d.addMouseListener(t);
        d.addMouseMotionListener(t);
        f.setVisible(true);
    }

}
