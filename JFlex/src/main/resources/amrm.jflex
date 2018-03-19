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
id = (_|[:jletter:])(_|[:jletterdigit:])*
ws = {flinha} | [\ \t\f]
comlinha = "//"[^\r\n]*

%states IF WHILE INT
%xstates COMENT 

%%
<COMENT>{
	"/*" {throw new RuntimeException("Aninhamento de comentário não permitido!" + "-> na linha: " + yyline + ", coluna: " + yycolumn);}
	!"*/" {yybegin(COMENT);}
	"*/" {yybegin(YYINITIAL);}
	. 	 {throw new RuntimeException("Comentário com erro : " + yytext() + "-> na linha: " + yyline + ", coluna: " + yycolumn);}
}
<INT> {
	[intl] {yybegin(YYINITIAL);}
}
{comlinha} {} //comentario de linha
"/*" {yybegin(COMENT);} //testar o comentário especifico
{ws} {}
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
{intl} {
	
}
{id} {}
"{"|"}" {}
"["|"]" {}
"("|")" {}
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

