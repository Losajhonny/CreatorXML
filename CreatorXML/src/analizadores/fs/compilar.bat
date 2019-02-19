cd ..
cd ..
cd ..
java -jar lib\jflex-1.6.1.jar src\analizadores\fs\Scanner_fs.jflex
java -jar lib\java-cup-11b.jar -parser Parser_fs -symbols sym src\analizadores\fs\Parser_fs.cup
move Parser_fs.java src\analizadores\fs
move sym.java src\analizadores\fs
