/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testswing;

import javax.swing.*;

public class Testswing {
    public static void main(String[] args) {
        JFrame f = new JFrame("Test1");
        JPanel p = (JPanel) f.getContentPane();
        p.add("North", new JLabel("UN"));
        p.add("Center", new JLabel("DEUX"));
        p.add("South", new JButton("TROIS"));
        f.pack();
        f.setVisible(true);
    }
}
