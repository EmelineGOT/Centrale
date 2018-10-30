import java.util.concurrent.TimeUnit;


public class Course {

	private long StartTime;
	
	public Course () {
		StartTime = System.currentTimeMillis( );
	}
	
	public long Stop() {
		long millis = System.currentTimeMillis( ) - StartTime;
		long TempsEcouleEnSecondes = 
			    TimeUnit.MILLISECONDS.toSeconds(millis) - 
			    TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(millis)); 
		
		return TempsEcouleEnSecondes;
	}
	
}
