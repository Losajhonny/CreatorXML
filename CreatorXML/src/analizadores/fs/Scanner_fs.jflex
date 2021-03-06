package analizadores.fs;

import java_cup.runtime.Symbol;

%%
%class Scanner_fs
%public
%line
%char
%cup
%unicode
%ignorecase

%init{
    yyline = 1;
%init}

ID          =   [A-Za-z_][A-Za-z0-9_]*

DCCADENA    =   "\"" [^\n]* "\""
SCCADENA    =   "\'" [^\n]* "\'"
CADENA      =   {DCCADENA} | {SCCADENA}

ENTERO      =   [0-9]+
DECIMAL     =   [0-9]+"."[0-9]+

UNICOMMENT  =   "//".*[\n|\r\n]
MULCOMMENT  =   "/*".*"*/"
COMMENT     =   {UNICOMMENT} | {MULCOMMENT}

ESPACIOS    =   [ \r\n\t\f]

%{
    /**
    * Retorna el simbolo con sym.value
    * Con la linea, columna y texto de flex
    */
    private Symbol symbol(int value){
        return new Symbol(value, yyline, yychar, yytext());
    }

    /**
    * Retorna el simbolo con sym.id y valor asignado
    * Con la linea, columna de flex
    */
    private Symbol symbol(int id, Object value){
        return new Symbol(id, yyline, yychar, value);
    }
%}
%%

"nulo"              { return symbol(sym.pr_nulo); }
"verdadero"         { return symbol(sym.pr_verdadero); }
"falso"             { return symbol(sym.pr_falso); }
"var"               { return symbol(sym.pr_var); }

"importar"          { return symbol(sym.pr_importar); }
"detener"           { return symbol(sym.pr_detener); }

"selecciona"        { return symbol(sym.pr_selecciona); }
"caso"              { return symbol(sym.pr_caso); }
"retornar"          { return symbol(sym.pr_retornar); }
"si"                { return symbol(sym.pr_si); }
"sino"              { return symbol(sym.pr_sino); }

"funcion"           { return symbol(sym.pr_funcion); }
"descendente"       { return symbol(sym.pr_descendente); }
"ascendente"        { return symbol(sym.pr_ascendente); }
"creararraydesdearchivo" { return symbol(sym.pr_creararraydesdearchivo); }
"invertir"          { return symbol(sym.pr_invertir); }
"maximo"            { return symbol(sym.pr_maximo); }
"minimo"            { return symbol(sym.pr_minimo); }
"filtrar"           { return symbol(sym.pr_filtrar); }
"buscar"            { return symbol(sym.pr_buscar); }
"map"               { return symbol(sym.pr_map); }
"reducir"           { return symbol(sym.pr_reducir); }
"todos"             { return symbol(sym.pr_todos); }
"alguno"            { return symbol(sym.pr_alguno); }

"leergxml"          { return symbol(sym.pr_leergxml); }
"obtenerporetiqueta" { return symbol(sym.pr_obtenerporetiqueta); }
"obtenerpoid"       { return symbol(sym.pr_obtenerporid); }
"obtenerpornombre"  { return symbol(sym.pr_obtenerpornombre); }
"crearventana"      { return symbol(sym.pr_crearventana); }
"crearcontenedor"   { return symbol(sym.pr_crearcontenedor); }
"creartexto"        { return symbol(sym.pr_creartexto); }
"crearcajatexto"    { return symbol(sym.pr_crearcajatexto); }
"crearareatexto"    { return symbol(sym.pr_crearareatexto); }
"crearcontrolnumerico" { return symbol(sym.pr_crearcontrolnumerico); }
"creardesplegable"  { return symbol(sym.pr_creardesplegable); }
"crearboton"        { return symbol(sym.pr_crearboton); }
"crearimagen"       { return symbol(sym.pr_crearimagen); }
"crearreproductor"  { return symbol(sym.pr_crearreproductor); }
"crearvideo"        { return symbol(sym.pr_crearvideo); }
"alclic"            { return symbol(sym.pr_alclic); }
"alcargar"          { return symbol(sym.pr_alcargar); }
"alcerrar"          { return symbol(sym.pr_alcerrar); }


"("                 { return symbol(sym.pari); }
")"                 { return symbol(sym.pard); }
"{"                 { return symbol(sym.llai); }
"}"                 { return symbol(sym.llad); }
"["                 { return symbol(sym.cori); }
"]"                 { return symbol(sym.cord); }
"."                 { return symbol(sym.punto); }
","                 { return symbol(sym.coma); }
":"                 { return symbol(sym.dospuntos); }
";"                 { return symbol(sym.ptcoma); }
"="                 { return symbol(sym.igual); }
"?"                 { return symbol(sym.inter); }

"+"                 { return symbol(sym.mas);  }
"-"                 { return symbol(sym.men);  }
"*"                 { return symbol(sym.por);  }
"/"                 { return symbol(sym.div);  }
"^"                 { return symbol(sym.pot);  }

"++"                { return symbol(sym.masmas); }
"--"                { return symbol(sym.menmen); }

">"                 { return symbol(sym.mayor); }
"<"                 { return symbol(sym.menor); }
">="                { return symbol(sym.mayorigual); }
"<="                { return symbol(sym.menorigual); }
"=="                { return symbol(sym.igualigual); }
"!="                { return symbol(sym.diferente); }

"&&"                { return symbol(sym.and); }
"||"                { return symbol(sym.or); }
"!"                 { return symbol(sym.not); }

"+="                { return symbol(sym.masigual); }
"*="                { return symbol(sym.porigual); }
"-="                { return symbol(sym.menigual); }
"/="                { return symbol(sym.divigual); }

"=>"                { return symbol(sym.asigesp); }

\n                  { yychar=1; }

{COMMENT}           { /*ignorando*/ }

{ENTERO}            { return symbol(sym.entero);           }
{DECIMAL}           { return symbol(sym.decimal);          }
{CADENA}            { return symbol(sym.cadena);           }

{ID}                { return symbol(sym.id);   }

{ESPACIOS}          { /*ignorando*/ }

.                   {System.err.println("Este es un error lexico: "+yytext()+", en la linea: "+yyline+", en la columna: "+yychar);}
