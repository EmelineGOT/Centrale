draw(Obj):-
	javaMethod(Obj,sleep(1000)),
	javaMethod(Obj,setColor(red)),
	javaMethod(Obj,addArc(170,10,36,36,20,90,1)),
	javaMethod(Obj,addButton(226,10,36,36,'Button')),
	javaMethod(Obj,setColor(blue)),
	javaMethod(Obj,addOval(170,56,36,36,0)),
	javaMethod(Obj,addLabel(226,56,36,36,'Label')),
	javaMethod(Obj,setColor(black)),
	javaMethod(Obj,addLine(170,102,206,126)),
	javaMethod(Obj,addOval(226,102,36,24,1)),
	javaMethod(Obj,setColor(gray)),
	javaMethod(Obj,addRoundRectangle(170,136,36,24,9,6,0)),
	javaMethod(Obj,addRectangle(226,136,36,24,0)),
	javaMethod(Obj,setColor(green)),
	javaMethod(Obj,addPolygon([170,170,188,206,188,170],[170,188,206,188,170,170],1)),
	javaMethod(Obj,addRectangle(226,170,36,36,1)),
	javaMethod(Obj,setColor(yellow)),
	javaMethod(Obj,addTextArea(226,216,36,36,4,30,'Text field \n line2 \n line3')),
	javaMethod(Obj,addOval(181,227,14,14,1)),
	javaMethod(Obj,addPolygon([184,188,191,184],[228,216,228,228],1)),
	javaMethod(Obj,addPolygon([191,204,194,191],[228,228,235,228],1)),
	javaMethod(Obj,addPolygon([194,198,188,194],[235,248,240,235],1)),
	javaMethod(Obj,addPolygon([188,177,181,188],[240,248,235,240],1)),
	javaMethod(Obj,addPolygon([181,171,184,181],[235,228,228,235],1)),
	javaMethod(Obj,setColor(red)),
	javaMethod(Obj,addTextField(170,262,36,36,20,'Text Field')),
	javaMethod(Obj,addPolygon([226,262,226,226],[298,298,262,298],1)),
	javaMethod(Obj,addImage(170,308,36,36,'animal1.gif')).
