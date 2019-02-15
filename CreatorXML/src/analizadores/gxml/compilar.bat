cd ..
cd ..
cd ..
java -jar lib\jflex-1.6.1.jar src\analizadores\gxml\Scanner_gxml.jflex
java -jar lib\java-cup-11b.jar -parser Parser_gxml -symbols sym src\analizadores\gxml\Parser_gxml.cup
move Parser_gxml.java src\analizadores\gxml
move sym.java src\analizadores\gxml