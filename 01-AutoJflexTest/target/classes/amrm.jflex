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
id = (_|[:jletter:]) (_|[:jletterdigit:])*
ws = [\ \n\r\t\f]
intl =  0|[1-9][0-9]*
ic = [^\n\r]
coment1 = "/**" [:jletterdigit:] "*"+ "/"


%%
{coment1} {}
"//"{ic}* {}
{ws} {}
{id} {}
{intl} {}
boolean {}
class {}
public {}
extends {}
static {}
void {}
main {}
String {}
int {}
while {}
if {}
else {}
return {}
length {}
true {}
false {}
this {}
new {}
System.out.println {}
"{" {}
"}" {}
"[" {}
"]" {}
"(" {}
")" {}
";" {}
"." {}
"," {}
"=" {}
"*" {}
"+" {}
"-" {}
"!" {}
"!=" {}
"==" {}
"<" {}
"&&" {}
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
