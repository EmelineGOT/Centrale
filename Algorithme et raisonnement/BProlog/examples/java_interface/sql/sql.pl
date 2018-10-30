sql_prolog(JavaObj):-
    global_set(java_object,JavaObj),
    repeat,
    format("Password for root = ? "),
    readLine(LineCodes),
    (append(PassWord,"\n",LineCodes)->true;PassWord=LineCodes),
    catch(jdbc_connect("jdbc:mysql://localhost/test", "root", PassWord),
          Exception,(writeln(javaException(Exception)),fail)),!,
    jdbc_update("DROP TABLE IF EXISTS animal"),
    jdbc_update("CREATE TABLE animal (id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
             PRIMARY KEY (id), 
             name CHAR(40), 
             category CHAR(40))"),
    jdbc_update("INSERT INTO animal (name, category) VALUES 
                 ('snake', 'reptile'), 
                 ('frog', 'amphibian'), 
                 ('tuna', 'fish'), 
                 ('racoon', 'mammal')"),
    jdbc_query("SELECT id, name, category FROM animal"),
    jdbc_dump_results("animal","int id str name str category"),
    see('animal'),
    repeat,
    read(Tuple),
    (Tuple=end_of_file->seen;
     writeln(Tuple),
     fail),
    jdbc_disconnect.
    
jdbc_connect(DBName,AccountName,PassWord):-
    global_get(java_object,JavaObj),
    javaMethod(JavaObj,jdbc_connect(DBName,AccountName,PassWord)).

jdbc_update(Query):-
    global_get(java_object,JavaObj),
    javaMethod(JavaObj,jdbc_update(Query)).

jdbc_query(Query):-
    global_get(java_object,JavaObj),
    javaMethod(JavaObj,jdbc_query(Query)).

jdbc_dump_results(FileName,Cols):-
    global_get(java_object,JavaObj),
    javaMethod(JavaObj,jdbc_dump_results(FileName,Cols)).

jdbc_disconnect:-
    global_get(java_object,JavaObj),
    javaMethod(JavaObj,jdbc_disconnect).



