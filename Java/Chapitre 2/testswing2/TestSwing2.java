package testswing2;

import javax.swing.*;

public class TestSwing2 {

    public static void main(String[] args) {
        JFrame f = new JFrame("test2");
        JPanel p = (JPanel) f.getContentPane();
        JButton b = new JButton("PUSH");
        p.add("Center", b);
        JLabel l = new JLabel("nb clics boutons : 0");
        p.add("South", l);
        b.addActionListener( new TraiteBouton(l));
        f.pack();
        f.setVisible(true);
    }
}
