import java.util.*;

public class TestTaxi {

	public static void PerteDeTemp(double alpha) {
		for(double i=0.;i<alpha * 1.E7; i++)
			Math.cos(i);
	}
	
	public static void main(String[] args)  {

		boolean ok;
		
		Conducteur Joe = new Conducteur ("JoeLeTaxi", 3045);
		Taxi T1 = new Taxi("3434 tr 13", Joe);
		
		Personne Client1 = new Personne("unClient");
		ok = T1.charge(Client1);
		PerteDeTemp(4);
		ok = T1.decharge();
		System.out.println(T1);
		
		ok = T1.decharge();
		System.out.println(T1);
		
		ok = T1.charge(Client1);
		PerteDeTemp(2);
		ok = T1.decharge();
		System.out.println(T1);
		
	}

}
