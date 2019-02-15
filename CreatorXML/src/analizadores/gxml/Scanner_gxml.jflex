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

DCCADENA    =   "\"" [^\n]* "\""
SCCADENA    =   "\'" [^\n]* "\'"
CADENA      =   {DCCADENA} | {SCCADENA}
NUMERO      =   [0-9]+
UNICOMMENT  =   "##".*[\n|\r\n]
MULCOMMENT  =   "#$".*"$#"
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

"importar"          { return symbol(sym.pr_importar);      }
"ventana"           { return symbol(sym.pr_ventana);       }
"contenedor"        { return symbol(sym.pr_contenedor);    }
"texto"             { return symbol(sym.pr_texto);         }
"dato"              { return symbol(sym.pr_dato);          }
"listadatos"        { return symbol(sym.pr_listadatos);    }
"defecto"           { return symbol(sym.pr_defecto);       }
"control"           { return symbol(sym.pr_control);       }
"multimedia"        { return symbol(sym.pr_multimedia);    }
"boton"             { return symbol(sym.pr_boton);         }
"enviar"            { return symbol(sym.pr_enviar);        }

"verdadero"         { return symbol(sym.pr_verdadero);     }
"falso"             { return symbol(sym.pr_falso);         }

"id"                { return symbol(sym.pr_id);            }
"tipo"              { return symbol(sym.pr_tipo);          }
"color"             { return symbol(sym.pr_color);         }
"accioninicial"     { return symbol(sym.pr_accioninicial); }
"accionfinal"       { return symbol(sym.pr_accionfinal);   }
"x"                 { return symbol(sym.pr_x);             }
"y"                 { return symbol(sym.pr_y);             }
"alto"              { return symbol(sym.pr_alto);          }
"ancho"             { return symbol(sym.pr_tipo);          }
"borde"             { return symbol(sym.pr_borde);         }
"nombre"            { return symbol(sym.pr_nombre);        }
"fuente"            { return symbol(sym.pr_fuente);        }
"tam"               { return symbol(sym.pr_tam);           }
"negrita"           { return symbol(sym.pr_negrita);       }
"cursiva"           { return symbol(sym.pr_cursiva);       }
"maximo"            { return symbol(sym.pr_maximo);        }
"minimo"            { return symbol(sym.pr_minimo);        }
"accion"            { return symbol(sym.pr_accion);        }
"referencia"        { return symbol(sym.pr_referencia);    }
"path"              { return symbol(sym.pr_path);          }
"auto-reproduccion" { return symbol(sym.pr_autoreproduccion); }

"<"                 { return symbol(sym.men);              }
">"                 { return symbol(sym.may);              }
"/"                 { return symbol(sym.slash);            }
"="                 { return symbol(sym.igual);            }


\n                  { yychar=1; }

{COMMENT}           { /*ignorando*/ }
{NUMERO}            { return symbol(sym.numero);           }
{CADENA}            { return symbol(sym.cadena);           }
{ESPACIOS}          { /*ignorando*/ }

.                   {System.err.println("Este es un error lexico: "+yytext()+", en la linea: "+yyline+", en la columna: "+yychar);}