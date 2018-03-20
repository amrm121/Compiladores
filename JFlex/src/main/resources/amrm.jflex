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

%xstates COMENT INT

%%
<COMENT>{
	~"*/" {yybegin(YYINITIAL);}
	. {throw new RuntimeException("Comentário sem fim." + " Na linha: " + yyline+1 + ", coluna: " + yycolumn+1);}
}
<INT>{
	. {yybegin(YYINITIAL);}
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
int/\s{id} {}
while {}
if {}
else {}
return {}
length {}
true {}
false {}
this {}
new {}
System.out.println/"("~")" {}
{intl}/\P{L} {}
{id} {}
"{" {}
"}" {}
"[" {}
"]" {}
"(" {}
")" {}
";"{ws}*?$ {}
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
. { throw new RuntimeException("Caractere ilegal!" + "'" + yycharat(yyline+1) + "'" + " na linha: " + (yyline+1) + ", coluna: " + (yycolumn+1)); }

