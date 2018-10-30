/*********************************************************************
%   File   : draw.java
%   Author : Neng-Fa ZHOU
%   Date   : 1998
%   Purpose: A server that processes drawing requests from bprolog
*********************************************************************/
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import bprolog.plc.Plc;

public 
  class draw extends Frame {
    int maxComps = 100;
    public int screenWidth=500;
    public int screenHeight=500;
    public Hashtable ht;
    DJComponent[] comps = new DJComponent[maxComps];
    DJComponent comp;
    int noComps = 0;
    Color color = Color.black;

    public draw(){
      super("draw");
      addWindowListener(new WindowAdapter(){
	public void windowClosing(WindowEvent e){
	  System.exit(0);
	}});
      setSize(screenWidth,screenHeight);
      initializeHashtable();
      show();
    }

    public static void main(String args[]) {
      draw dj = new draw();
      dj.draw();
    }
	
    public void draw() {
      Plc.startPlc(new String []{});
      Plc goal = new Plc("draw", new Object[] {this});
      Plc.exec("cl('draw')");
      goal.call();
    }

   void initializeHashtable(){
        ht = new Hashtable(13);

     	ht.put("black",Color.black);
	ht.put("blue",Color.blue);
    	ht.put("cyan",Color.cyan);
	ht.put("darkGray",Color.darkGray);
	ht.put("gray",Color.gray);
	ht.put("green",Color.green);
        ht.put("lightGray",Color.lightGray);
	ht.put("magenta",Color.magenta);
	ht.put("orange",Color.orange);
	ht.put("pink",Color.pink);
	ht.put("red",Color.red);
	ht.put("white",Color.white);
	ht.put("yellow",Color.yellow);
   }

    public void paint(Graphics g){
        for (int i=0;i<noComps;i++)  comps[i].draw();
    }

   void expandCompsIfNecessary(){
        DJComponent[] anotherComps;

        if (noComps==comps.length){
	    anotherComps = new DJComponent[comps.length*2];
	    for (int i=0;i<comps.length;i++)  // copy
		anotherComps[i] = comps[i];
	    comps = anotherComps;
        }
   }
		     
   public void setColor(String cstring){
	color = (Color)ht.get(cstring);
   }

   public void addArc(Integer x, Integer y, Integer w, Integer h, Integer startAngle, Integer angle,Integer fill){
	expandCompsIfNecessary();
        comp = new DJArc(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),startAngle.intValue(),angle.intValue(),color,fill.intValue());
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addButton(Integer x, Integer y, Integer w, Integer h, String text){
	expandCompsIfNecessary();
        comp = new DJButton(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),color,text);
        comp.draw();
        comps[noComps++] = comp;  
  }

   public void addImage(Integer x, Integer y, Integer w, Integer h, String file){
	expandCompsIfNecessary();
        comp = new DJImage(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),color,file);
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addLabel(Integer x, Integer y, Integer w, Integer h, String text){
	expandCompsIfNecessary();
        comp = new DJLabel(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),color,text);
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addLine(Integer x1, Integer y1, Integer x2, Integer y2){
	expandCompsIfNecessary();
        comp = new DJLine(this,x1.intValue(),y1.intValue(),x2.intValue(),y2.intValue(),color);
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addOval(Integer x, Integer y, Integer w, Integer h, Integer fill){
	expandCompsIfNecessary();
        comp = new DJOval(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),color,fill.intValue());
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addPolygon(Object[] xs, Object[] ys, Integer fill){
	int[] int_xs, int_ys;
	expandCompsIfNecessary();
	int_xs = new int[xs.length];
	int_ys = new int[ys.length];
	for (int i=0;i<xs.length;i++){
	    int_xs[i] = ((Integer)xs[i]).intValue();
	    int_ys[i] = ((Integer)ys[i]).intValue();
	}
        comp = new DJPolygon(this,int_xs,int_ys,color,fill.intValue());
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addRectangle(Integer x, Integer y, Integer w, Integer h, Integer fill){
	expandCompsIfNecessary();
        comp = new DJRectangle(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),color,fill.intValue());
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addRoundRectangle(Integer x, Integer y, Integer w, Integer h, Integer arcW, Integer arcH, Integer fill){
	expandCompsIfNecessary();
        comp = new DJRoundRectangle(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),arcW.intValue(),arcH.intValue(),color,fill.intValue());
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addStar(Integer x, Integer y, Integer smallD,  Object[] xs, Object[] ys, Integer fill){
	int[] int_xs,int_ys;
	expandCompsIfNecessary();
	int_xs = new int[xs.length];
	int_ys = new int[ys.length];
	for (int i=0;i<xs.length;i++){
	    int_xs[i] = ((Integer)xs[i]).intValue();
	    int_ys[i] = ((Integer)ys[i]).intValue();
	}
        comp = new DJStar(this,x.intValue(),y.intValue(),smallD.intValue(), int_xs, int_ys, color,fill.intValue());
        comp.draw();
        comps[noComps++] = comp;  
  }

   public void addTextArea(Integer x, Integer y, Integer w, Integer h, Integer rows, Integer cols, String text){
	expandCompsIfNecessary();
        comp = new DJTextArea(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),rows.intValue(),cols.intValue(),color,text);
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void addTextField(Integer x, Integer y, Integer w, Integer h, Integer cols, String text){
	expandCompsIfNecessary();
        comp = new DJTextField(this,x.intValue(),y.intValue(),w.intValue(),h.intValue(),cols.intValue(),color,text);
        comp.draw();
        comps[noComps++] = comp;  
   }

   public void sleep(Integer mill) {
	try {
	    Thread.sleep(mill.intValue(),0);
	} catch(InterruptedException e) {}
   }
}

abstract class DJComponent {
     int x, y, width, height;    
     Frame ap;
     Color color = Color.black;
     Font font;

     abstract void draw();

     public DJComponent(Frame ap, int x, int y, int width, int height,Color color){
        this.ap = ap;
	this.x     = x;
        this.y     = y;
        this.width = width;
        this.height= height;
        this.color = color;
     }
}

class DJArc extends DJComponent {
      boolean fill;
      int startAngle,arcAngle;
      public DJArc(Frame ap, int x, int y, int width, int height,int startAngle, int arcAngle, Color color,int fill){
	super(ap,x,y,width,height,color);
	if (fill==0) this.fill = false; else this.fill = true;
	this.startAngle = startAngle;
	this.arcAngle = arcAngle;
     }

     void draw(){
	Graphics g = ap.getGraphics();
        g.setColor(color);
	if (fill)
	    g.fillArc(x,y,width,height,startAngle,arcAngle);
	else
	    g.drawArc(x,y,width,height,startAngle,arcAngle);
    }
}

class DJButton extends DJComponent {
      String text;
      Button bt;

      public DJButton(Frame ap, int x, int y, int width, int height,Color color,String text){
	super(ap,x,y,width,height,color);
	this.text = text;
        this.font = ap.getFont();
        bt = new Button();
        ap.add(bt);
      }

     void draw(){
	bt.setLocation(x,y);
        bt.setSize(width,height);
        bt.setLabel(text);
        bt.setForeground(color);
	bt.setFont(font);
    }
}

class DJImage extends DJComponent {
      String text;
      Image image;

      public DJImage(Frame ap, int x, int y, int width, int height,Color color, String file){
	super(ap,x,y,width,height,color);
	System.out.println("Image "+file);
	image = Toolkit.getDefaultToolkit().getImage(file);
     }

     void draw(){
       Graphics g = ap.getGraphics();
       g.drawImage(image,x,y,width,height,ap);
    }
}
class DJLabel extends DJComponent {
      String text;
      Label lab;

      public DJLabel(Frame ap, int x, int y, int width, int height,Color color, String text){
	super(ap,x,y,width,height,color);
	this.text = text;
        this.font = ap.getFont();
     }

     void draw(){
       int x0,y0;
       FontMetrics fm = ap.getFontMetrics(font);
       Graphics g = ap.getGraphics();
       g.setColor(color);
       g.setFont(font);
       x0 = x;
       y0 = y+(y-fm.getHeight())/2;
       g.drawString(text,x0,y0);
    }
}
class DJLine extends DJComponent {
      int x1,y1,x2,y2;
      public DJLine(Frame ap, int x1, int y1, int x2, int y2,Color color){
	super(ap,0,0,0,0,color);
	this.x1 = x1;
	this.x2 = x2;
	this.y1 = y1;
	this.y2 = y2;
     }

     void draw(){
	Graphics g = ap.getGraphics();
        g.setColor(color);
	g.drawLine(x1,y1,x2,y2);
    }
}


class DJOval extends DJComponent {
      boolean fill;
      public DJOval(Frame ap, int x, int y, int width, int height,Color color,int fill){
	super(ap,x,y,width,height,color);
	if (fill==0) this.fill = false; else this.fill = true;
     }

     void draw(){
	Graphics g = ap.getGraphics();
        g.setColor(color);
	if (fill)
	    g.fillOval(x,y,width,height);
	else
	    g.drawOval(x,y,width,height);
    }
}

class DJPolygon extends DJComponent {

      boolean fill;
      Polygon poly;

      public DJPolygon(Frame ap, int[] xs, int[] ys, Color color,int fill){
	super(ap,0,0,0,0,color);
	if (fill==0) this.fill = false; else this.fill = true;
	this.poly = new Polygon(xs,ys,ys.length);
     }

     void draw(){
	Graphics g = ap.getGraphics();
        g.setColor(color);
	if (fill)
	    g.fillPolygon(poly);
	else
	    g.drawPolygon(poly);
    }
}

class DJRectangle extends DJComponent {
      boolean fill;
      public DJRectangle(Frame ap, int x, int y, int width, int height,Color color,int fill){
	super(ap,x,y,width,height,color);
	if (fill==0) this.fill = false; else this.fill = true;
     }

     void draw(){
	Graphics g = ap.getGraphics();
        g.setColor(color);
	if (fill)
	    g.fillRect(x,y,width,height);
	else
	    g.drawRect(x,y,width,height);
    }
}

class DJRoundRectangle extends DJComponent {
      boolean fill;
      int arcW,arcH;
      public DJRoundRectangle(Frame ap, int x, int y, int width, int height,int arcW, int arcH, Color color,int fill){
	super(ap,x,y,width,height,color);
	if (fill==0) this.fill = false; else this.fill = true;
	this.arcW = arcW;
	this.arcH = arcH;
     }

     void draw(){
	Graphics g = ap.getGraphics();
        g.setColor(color);
	if (fill)
	    g.fillRoundRect(x,y,width,height,arcW,arcH);
	else
	    g.drawRoundRect(x,y,width,height,arcW,arcH);
    }
}

class DJStar extends DJComponent {
      boolean fill;
      Rectangle center;
      int[] xs,ys;
      public DJStar(Frame ap, int x, int y, int smallD, int[] xs, int[] ys, Color color, int fill){
	super(ap,0,0,0,0,color);
	if (fill==0) this.fill = false; else this.fill = true;
        center = new Rectangle(x,y,smallD,smallD);
	this.xs = xs;
	this.ys = ys;
    }

     void draw(){
        int x1,x2,x3,y1,y2,y3,i;
	int[] trian_xs, trian_ys;
	Graphics g = ap.getGraphics();
        g.setColor(color);
	if (fill){
           g.fillOval(center.x,center.y,center.width,center.height);
	   i=0;
	   while (i<xs.length-2){
		x1 = xs[i];
		y1 = ys[i];
		x2 = xs[i+1];
		y2 = ys[i+1];
		x3 = xs[i+2];
		y3 = ys[i+2];
	        trian_xs = new int[]{x1,x2,x3};
	        trian_ys = new int[]{y1,y2,y3};
	   	g.fillPolygon(trian_xs,trian_ys,3);
		i += 2;
	   }
	} else {
	   i=0;
	   while (i<=xs.length-2){
		x1 = xs[i];
		y1 = ys[i];
		x2 = xs[i+1];
		y2 = ys[i+1];
	   	g.drawLine(x1,y1,x2,y2);
		i += 1;
	   }
	}
    }
}

class DJTextArea extends DJComponent {
      String text;
      TextArea ta;

      public DJTextArea(Frame ap, int x, int y, int width, int height,int rows,int cols,Color color,String text){
	super(ap,x,y,width,height,color);
	this.text = text;
        this.font = ap.getFont();
	ta = new TextArea(text,rows,cols);
        ap.add(ta);
     }

     void draw(){
	ta.setLocation(x,y);
        ta.setSize(width,height);
        ta.setForeground(color);
	ta.setFont(font);
    }
}

class DJTextField extends DJComponent {
      String text;
      TextField tf;

      public DJTextField(Frame ap, int x, int y, int width, int height,int cols,Color color,String text){
	super(ap,x,y,width,height,color);
	this.text = text;
        this.font = ap.getFont();
	tf = new TextField(text,cols);
        ap.add(tf);
     }

     void draw(){
	tf.setLocation(x,y);
        tf.setSize(width,height);
        tf.setForeground(color);
	tf.setFont(font);
    }
}

