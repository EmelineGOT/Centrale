// by Neng-Fa Zhou
import java.awt.*;
import java.awt.event.*;
import bprolog.plc.Plc;
import java.io.*;

public class queens_fc extends Frame implements ActionListener {
    Label lb;
    TextField tf;
    public int screenWidth=600;
    public int screenHeight=600;
    public Integer[] queens; 
    Color pieceColor = Color.red;
    public int n,w,h;
    
    public queens_fc(){
	super("queens_fc");
	addWindowListener(new WindowAdapter(){
		public void windowClosing(WindowEvent e){
		    System.exit(0);
		}});
	Panel p = new Panel();
	lb = new Label("N=?");
	tf = new TextField("100");
	p.add(lb); p.add(tf);
	tf.addActionListener(this);
	add("North",p);

	n = 100;
	setSize(screenWidth,screenHeight);

	Plc.startPlc(new String []{});
	Plc goal = new Plc("queens", new Object[] {new Integer(n),this});
	Plc.exec("cl('queens_fc')");
	goal.call();

	setVisible(true);
    }
     
    public static void main(String args[]) {
	queens_fc qf = new queens_fc();
    }

    public void actionPerformed(ActionEvent o){
	try {
	    n = Integer.parseInt(tf.getText());
	} catch (NumberFormatException e){
	    n = 100;
	}
	Plc goal = new Plc("queens", new Object[] {new Integer(n),this});
	Plc.exec("load('queens_fc')");
	goal.call();
	repaint();
    }

    public void paint(Graphics g){
	w = screenWidth/(n+2);
	h = screenHeight/(n+2);
	int hMargin = 50;
	int col,i,j;

	if (queens==null || queens[0]==null) return;
	
	for (i=0;i<n;i++)
	    for (j=0;j<n;j++)
		g.drawRect((i+1)*w,(j+1)*h+hMargin,w,h);

	for (i=0;i<n;i++){
	    col = ((Integer)queens[i]).intValue();
	    g.setColor(pieceColor);
	    g.fillOval((i+1)*w,col*h+hMargin,w,h);
	}
    }

    public void drawQueens(Object[] pos){
	queens = new Integer[n];
	for (int i=0;i<n;i++){
	    queens[i] = (Integer)pos[i];
	}
    }
}


