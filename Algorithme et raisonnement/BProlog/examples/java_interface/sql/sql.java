import java.sql.*;
import java.io.*;
import java.util.*;
import bprolog.plc.Plc;

/**
 * sql is a simple example that illustrates the link between B-Prolog
 * and MySql through the JDBC and PLC interfaces. To run this program, use
 * the following command:
 *   
 *  java -cp xxx sql
 *
 * where xxx must contain both plc.jar and MySQL Connector/J. 
 * This program only works on Windows.
 *
 * @auther Neng-Fa Zhou, 2008
 */
public class sql {
    Connection conn = null;
    Statement s = null;

    public static void main(String args[]) {
	sql sqlp = new sql();
    }
    
    public sql() {
	Plc.startPlc(new String []{});
	Plc goal = new Plc("sql_prolog", new Object[] {this});
	Plc.exec("cl(sql)");
	goal.call();
    }

    /**
     * Request to establish a connection
     */
    public void jdbc_connect(Object[] db, Object[] account, Object[] password) throws Exception {
	String dbStr = objArray2Str(db);
	String accountStr = objArray2Str(account);
	String passwordStr = objArray2Str(password);

	try {
	    /* getConnection */
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    conn = DriverManager.getConnection(dbStr,accountStr,passwordStr);

	    if(!conn.isClosed())
		System.out.println("Successfully connected to " +
				   "MySQL server using TCP/IP...");

	    s = conn.createStatement();
	}
	catch(Exception e) {
	    System.err.println("Exception: " + e.getMessage());
	    throw(e);
	} 
    }

    /**
     * Request to establish a connection
     */
    public void jdbc_disconnect() throws Exception {
	conn.close();
	s.close();
    }

    /**
     * Request to execute an update 
     */
    public void jdbc_update(Object[] query) throws Exception {
	String queryStr = objArray2Str(query);
	System.out.println("update "+queryStr);
	s.executeUpdate(queryStr);
    }

    /**
     * Request to execute a query
     */
    public void jdbc_query(Object[] query) throws Exception {
	String queryStr = objArray2Str(query);
	System.out.println("update "+queryStr);
	s.executeQuery(queryStr);
    }

    /**
     * Request to dump the results of the previous query into a file in Prolog format
     */
    public void jdbc_dump_results(Object[] fileName,Object[] cols) throws Exception{
	String fileNameStr = objArray2Str(fileName);
	String[] colStrs = objArray2Strs(cols);
	PrintWriter pw = new PrintWriter(new FileWriter(fileNameStr));

	ResultSet rs = s.getResultSet();
	while (rs.next()){
	    int i = 0;
	    pw.print(fileNameStr+"(");
	    while (i<colStrs.length){
		String colType = colStrs[i];
		String colName = colStrs[i+1];
		if (colType.equals("int")){
		    pw.print(rs.getInt(colName));
		} else if (colType.equals("str")){
		    pw.print(rs.getString(colName));
		} else throw new RuntimeException("unsupported column type");
		i += 2;
		if (i<colStrs.length) pw.print(","); else pw.println(").");
	    }
	}
	pw.close();
	rs.close();
    }

    static String objArray2Str(Object[] arr){
	char[] chs = new char[arr.length];
	for (int i=0;i<arr.length;i++){
	    chs[i] = (char)((Integer)arr[i]).intValue();
	}
	return new String(chs);
    }

    static String[] objArray2Strs(Object[] arr){
	String str = objArray2Str(arr);
	Vector v = new Vector();
	Scanner sc = new Scanner(str);
	while (sc.hasNext()){
	    v.add(sc.next());
	}
	String[] strs = new String[v.size()];
	for (int i=0;i<v.size();i++){
	    strs[i] = (String)v.elementAt(i);
	}
	return strs;
    }
}	

	
    
    
