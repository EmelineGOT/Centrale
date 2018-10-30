// by Nobukuni Kino
// simplified by Neng-Fa Zhou
import java.awt.*;
import java.awt.event.*;
import bprolog.plc.Plc;

public 
  class queens extends Frame {
    static int nqueens = 8;
    int w,h;
    Color pieceColor = new Color(255,150,150);

    /* Run as an application */
    public static void main(String args[]) {
      queens qb = new queens();
      qb.queen();
      System.exit(0);
    }

    public queens(){
      super("queens");

      addWindowListener(new WindowAdapter(){
	public void windowClosing(WindowEvent e){
	  System.exit(0);
	}});

      setSize(321,321);
      show();
    }
        
    public void queen() {
      Plc.startPlc(new String []{});
      Integer[] queens = new Integer[nqueens];
      for (int i=0; i<nqueens; i++) queens[i] = new Integer(i+1);
      Plc goal = new Plc("callQueens", new Object[] {queens,this});
      Plc.exec("cl('queens')");
      goal.call();
    }
				 
    public void paint(Graphics g) {
      board(g);
    }

    public void board(Graphics g) {
      w = (getSize().width-1)/nqueens;
      h = (getSize().height-1)/nqueens;
      g.setColor(Color.black);
      g.drawRect(0, 0, nqueens*w+1, nqueens*h+1);
      
      for (int i = 1; i <= nqueens; i++) {
	for (int j = 1; j <= nqueens; j++) {
	  clearSquare(i,j);
	}
      }
    }

    public void putSquare(Integer row, Integer col) {
      putSquare(row.intValue(), col.intValue());
    }

    public void putSquare(int row, int col) {
      Graphics g = getGraphics();
      g.setColor(pieceColor);
      g.fillRect(w*(row-1)+1, h*(col-1)+1, w, h);
      Thread.yield();
    }
	
    public void clearSquare(Integer row, Integer col) {
      clearSquare(row.intValue(), col.intValue());
    }

    public void clearSquare(int row, int col) {
      Graphics g = getGraphics();
      if ((row+col)%2 == 1) {
	g.setColor(Color.black);
      }
      else {
	g.setColor(Color.white);
      }
      g.fillRect(w*(row-1)+1, h*(col-1)+1, w, h);
      Thread.yield();
    }

    public void sleep(Integer mill) {
      try {
	Thread.sleep(mill.intValue(),0);
      } catch(InterruptedException e) {}
    }
  }

