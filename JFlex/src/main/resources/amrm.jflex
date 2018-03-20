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
wso = [\ \t\f]
comlinha = "//"[^\r\n]*
ops = "&&" | "<" | "==" | "!=" | "+" | "-" | "*" | "!"
delim = "." | "," | "=" | "(" | ")" | "[" | "]" | "{" | "}"
endlim = ";"{wso}*?

%xstates COMENT LEX LEXA LEXA1

%%
<COMENT>{
	~"*/" {yybegin(YYINITIAL);}
	. {throw new RuntimeException("Comentário sem fim." + " Na linha: " + (yyline+1) + ", coluna: " + (yycolumn+1));}
}
<LEX>{
	{wso}+{id} {yybegin(YYINITIAL);}
	. {throw new RuntimeException("Tipo básico inicializado sem variável." + " Na linha: " + (yyline+1) + ", coluna: " + (yycolumn+1));}
}
<LEXA>{
	"["{intl}?"]"{wso}*? {}
	{endlim}$ {yybegin(YYINITIAL);}
	{id} {yybegin(LEXA1);}
	<LEXA1>{
		{delim} {yybegin(YYINITIAL);}
		";"{wso}*?$ {yybegin(YYINITIAL);}
	}
	. {throw new RuntimeException("Tipo básico[] inicializado sem variável." + " Na linha: " + (yyline+1) + ", coluna: " + (yycolumn+1));}
}
{comlinha} {} //comentario de linha
"/*" {yybegin(COMENT);} //testar o comentário especifico
{ws} {}
boolean {yybegin(LEX);}
class {}
public {}
extends {} 
static {}
void {}
main {}
String / "["~"]" {yybegin(LEXA);}
String {yybegin(LEX);}
int / "["~"]" {yybegin(LEXA);} //int quando declarado sempre deve ser seguido de um identificador[
int {yybegin(LEX);}
while {}
if {}
else {}
return {}
length {}
true {}
false {}
this {}
new {}
{id} {}
{ops} {}
System.out.println {}
{intl} / \P{L} {} //usando o lookahead '/' pra nao deixar nenhum inteiro passar como intl id intl como acontecia em 99c9 99 token intl c9 token id
{endlim}$ {} //; apenas no fim de linha (mesmo que tenham espaços em branco)
{delim} {}
. { throw new RuntimeException("Caractere ilegal! " + " na linha: " + (yyline+1) + ", coluna: " + (yycolumn+1)); }

