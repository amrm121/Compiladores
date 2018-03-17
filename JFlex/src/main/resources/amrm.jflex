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
ws = [\ \t\f]
el = [\r\n]
intl =  0|[1-9][0-9]*
cstart = "/*"
cend = "*/"
com = (cstart)"*"+
comlinha = "//"[^el]*


%%
{comlinha} {} //comentario de linha
//{comente} {} //testar o comentário especifico
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
