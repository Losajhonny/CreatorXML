package analizadores.gxml;

import java_cup.runtime.Symbol;

%%
%class Scanner_gxml
%public
%line
%char
%cup
%unicode
%ignorecase

%init{
    yyline = 1;
%init}

ESPACIOS        =   [ \r\n\t\f]

RUTA            =   (("/"[^/]+)+"."[^\n]+|[A-Za-z]":"("\\"[^/]+)+"."[^\n]+)
LLFUNCION       =   "{" [^\n]+ "}"
ENTERO          =   [0-9]+
DECIMAL         =   [0-9]+"."[0-9]+

CSCADENA        =   "'" ([^\n]|[\'])* "'"
CDCADENA        =   "\"" ([^\n]|[\"])* "\""
CADENA          =   {CSCADENA}|{CDCADENA}

TODO            =   ">"[^"<"]*"<"

UNICOMMENT      =   "##".*[\r\n|\n|\r]
MULCOMMENT      =   "#$""#"*([^$#]|[^$]"#"|"$"[^#])*"$"*"$#"

%{
    private String cadena = "";

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

%state TK_TODO

%%

{UNICOMMENT}        {/*ignorar*/}
{MULCOMMENT}        {/*ignorar*/}

"importar"          { return symbol(sym.pr_importar); }
"ventana"           { return symbol(sym.pr_ventana); }
"contenedor"        { return symbol(sym.pr_contenedor); }
"texto"             { return symbol(sym.pr_texto); }
"control"           { return symbol(sym.pr_control); }
"listadatos"        { return symbol(sym.pr_listadatos); }
"referencia"        { return symbol(sym.pr_referencia); }
"defecto"           { return symbol(sym.pr_defecto); }
"dato"              { return symbol(sym.pr_dato); }
"multimedia"        { return symbol(sym.pr_multimedia); }
"boton"             { return symbol(sym.pr_boton); }
"enviar"            { return symbol(sym.pr_enviar); }

"id"                { return symbol(sym.pr_id); }
"tipo"              { return symbol(sym.pr_tipo); }
"color"             { return symbol(sym.pr_color); }
"accioninicial"     { return symbol(sym.pr_accioninicial); }
"accionfinal"       { return symbol(sym.pr_accionfinal); }
"alto"              { return symbol(sym.pr_alto); }
"ancho"             { return symbol(sym.pr_ancho); }
"borde"             { return symbol(sym.pr_borde); }
"nombre"            { return symbol(sym.pr_nombre); }
"fuente"            { return symbol(sym.pr_fuente); }
"tam"               { return symbol(sym.pr_tam); }
"negrita"           { return symbol(sym.pr_negrita); }
"cursiva"           { return symbol(sym.pr_cursiva); }
"maximo"            { return symbol(sym.pr_maximo); }
"minimo"            { return symbol(sym.pr_minimo); }
"accion"            { return symbol(sym.pr_accion); }
"path"              { return symbol(sym.pr_path); }
"auto-reproduccion" { return symbol(sym.pr_autoreproduccion); }

"verdadero"         { return symbol(sym.pr_verdadero); }
"falso"             { return symbol(sym.pr_falso); }

"="                 { return symbol(sym.igual); }
"/"                 { return symbol(sym.slash); }
"x"                 { return symbol(sym.pr_x); }
"y"                 { return symbol(sym.pr_y); }

"<"                 { return symbol(sym.men); }
">"                 { return symbol(sym.may); }

<YYINITIAL> ">"     { yybegin(TK_TODO); }

\n                  { yychar = 1; }

{ESPACIOS}          {/*ignorar*/}
{RUTA}              { return symbol(sym.ruta); }
{ENTERO}            { return symbol(sym.entero); }
{DECIMAL}           { return symbol(sym.decimal); }
{CADENA}            { return symbol(sym.cadena); }
{LLFUNCION}         { return symbol(sym.llfuncion); }

<TK_TODO>
{
    "<"             { String value=cadena; cadena=""; return symbol(sym.todo, value); }
    [^"<"]+         { cadena+=String.valueOf(yytext()); }
}

.                   {System.err.println("Este es un error lexico: "+yytext()+", en la linea: "+yyline+", en la columna: "+yychar);}