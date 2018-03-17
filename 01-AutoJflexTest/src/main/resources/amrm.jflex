package atividade1;

%%

/* N�o altere as configura��es a seguir */

%line
%column
%unicode
//%debug
%public
%standalone
%class Minijava
%eofclose

/* Insira as regras l�xicas abaixo */
ws = [\ \n\r\t\f]
digit = [0-9]

intl = {digit}+

%%
{intl}       { System.out.println("Token INT ("+yytext()+")"); }
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
