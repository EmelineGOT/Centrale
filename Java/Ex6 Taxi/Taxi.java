
public class Taxi extends Voiture {

	private Conducteur unConducteur;
	private Course uneCourse;
	private Long TempsTravailJournee;
	

	public Taxi(String i, Conducteur c) {
		super(i);
		unConducteur = c;
		uneCourse = null;
		TempsTravailJournee = (long) 0;
	}

	public boolean charge(Personne Client) {

		if (uneCourse == null) {
			uneCourse = new Course();
			return true;
		}

		return false;
	}
	
	public boolean decharge() {

		if (uneCourse != null) {
			TempsTravailJournee += uneCourse.Stop();
			uneCourse = null;
			return true;
		}

		return false;
	}

	@Override
	public String toString() {
		return "Taxi [taxiDriver=" + unConducteur + ", uneCourse=" + uneCourse
				+ ", TempsTravailJournee=" + TempsTravailJournee + "]";
	}

}
