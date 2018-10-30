package testswing3;

import java.awt.Point;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;

class Traitement implements MouseListener, MouseMotionListener {

    Dessin d;

    Traitement(Dessin d) {
        this.d = d;
    }

    public void mousePressed(MouseEvent e) {
    }

    public void mouseDragged(MouseEvent e) {
    }

    public void mouseReleased(MouseEvent e) {
    }

    public void mouseEntered(MouseEvent e) {
        d.ontrace = true;
        d.repaint();
    }

    public void mouseExited(MouseEvent e) {
        d.ontrace = false;
        d.repaint();
    }

    public void mouseClicked(MouseEvent e) {
        d.lastx = d.newx;
        d.lasty = d.newy;
        d.repaint();
    }

    public void mouseMoved(MouseEvent e) {
        Point pt;
        pt = e.getPoint();
        d.newx = pt.x;
        d.newy = pt.y;
        d.repaint();
    }
}
