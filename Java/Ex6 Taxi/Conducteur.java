
public class Conducteur extends Personne {
	private int Identifiant;
	
	public Conducteur(String n, int i) {
		super(n);
		Identifiant = i;
	}

	@Override
	public String toString() {
		return "Conducteur [Identifiant=" + Identifiant + "]";
	}
	
}
