package testswing2;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.*;

public class TraiteBouton implements ActionListener {
    private int nb;
    private JLabel j;

    TraiteBouton(JLabel j) {
        this.j = j;
        nb = 0;
    }

    public void actionPerformed(ActionEvent e) {
        ++nb;
        j.setText("nb clics boutons : " + (new Integer(nb).toString()));
    }
}
