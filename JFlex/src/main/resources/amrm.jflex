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
intl =  0|[1-9][0-9]*
flinha = \r|\n|\r\n
ic = [^\r\n]
id = (_|[:jletter:])(_|[:jletterdigit:])*
ws = {flinha} | [\ \t\f]
comlinha = "//"[^\r\n]*
comente = "/*"


%%
{intl} {
	try {
		System.out.println(yytext());
		Integer.parseInt(yytext());
	}catch(Exception e) {
		throw new RuntimeException();
	}
}
{comlinha} {} //comentario de linha
{comente} {} //testar o comentário especifico
{ws} {}
{id} {} 
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
