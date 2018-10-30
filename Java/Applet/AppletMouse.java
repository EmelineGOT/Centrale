import java.applet.*;
import java.awt.*;
import java.awt.event.*;

public class AppletMouse extends Applet implements MouseListener {
   int nbClick = 0;
   
   public void init() {
      super.init();
      addMouseListener(this);
   }

   public void mouseClicked(MouseEvent e) {
      nbClick++;
      repaint();
   }

   public void mouseEntered(MouseEvent e) {
   }

   public void mouseExited(MouseEvent e) {
   }
 
   public void mousePressed(MouseEvent e) {
   }
   
   public void mouseReleased(MouseEvent e) {
   }

   public void paint(Graphics g) {
      super.paint(g);
      g.drawString("Nombre de clics : " + nbClick, 10, 10);
   }

}