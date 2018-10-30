package testswing3;

import java.awt.Graphics;
import javax.swing.JPanel;

class Dessin extends JPanel {

    boolean ontrace;
    int lastx, lasty, newx, newy;

    Dessin() {
        super();
        ontrace = false;
        lastx = 300;
        lasty = 300;
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        if (ontrace) {
            g.drawLine(lastx, lasty, newx, newy);
        }
    }
}
