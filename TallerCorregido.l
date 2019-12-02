%{
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#define TKN_PREDARIT 1  /* Token definido para los predicados aritm�ticos */
#define TKN_PREDALGE 2  /* Token definido para los predicados algebraicos */
#define TKN_NUMBER 3    /* Token definido para n�meros */
#define TKN_PUNCTUATION 4  /* Token definido para los signos de puntuaci�n */
#define TKN_OPEREL 5    /* Token definido para los operadores relacionales */
#define TKN_OPERARIT 6    /* Token definido para los operadores aritm�ticos */
#define TKN_LOGICOPER 7   /* Token definido para los operadores l�gicos */
#define TKN_LOGICVAL 8   /* Token definido para los valores de verdad */
%}
%option nounput yylineno

DIGITO [0-9]
VARARIT [p|q|r|t]
VARALGE [x|y|z]


%%
[ \t\n]+						;
{VARARIT}						|
{VARARIT}{DIGITO}					|
{VARARIT}{DIGITO}{DIGITO}				|
{VARARIT}{DIGITO}{DIGITO}{DIGITO}			|
{VARARIT}{DIGITO}{DIGITO}{DIGITO}{DIGITO}		|
{VARARIT}{DIGITO}{DIGITO}{DIGITO}{DIGITO}{DIGITO}	{printf("%d ",TKN_PREDARIT);}
{VARALGE}						|
{VARALGE}{DIGITO}					|
{VARALGE}{DIGITO}{DIGITO}				|
{VARALGE}{DIGITO}{DIGITO}{DIGITO}			|
{VARALGE}{DIGITO}{DIGITO}{DIGITO}{DIGITO}		|
{VARALGE}{DIGITO}{DIGITO}{DIGITO}{DIGITO}{DIGITO}	{printf("%d ",TKN_PREDALGE);}
[0-9]+			|
[0-9]+\.[0-9]+		|
\.[0-9]+		{printf("%d ",TKN_NUMBER);}
":"                     {printf("%d ",TKN_PUNCTUATION);}
"="                     {printf("%d ",TKN_OPEREL);}
"+"                     {printf("%d ",TKN_OPERARIT);}
"-"                     {printf("%d ",TKN_OPERARIT);}
"*"                     {printf("%d ",TKN_OPERARIT);}
"/"                     {printf("%d ",TKN_OPERARIT);}
";"                     {printf("%d\n ",TKN_PUNCTUATION);}
">"                     {printf("%d ",TKN_OPEREL);}
"<"                     {printf("%d ",TKN_OPEREL);}
"("                     {printf("%d ",TKN_PUNCTUATION);}
")"                     {printf("%d ",TKN_PUNCTUATION);}
"["                     {printf("%d ",TKN_PUNCTUATION);}
"]"                     {printf("%d ",TKN_PUNCTUATION);}
"^"			{printf("%d ",TKN_LOGICOPER);}
"v"			{printf("%d ",TKN_LOGICOPER);}
"�"                     {printf("%d ",TKN_LOGICOPER);}
"V"			{printf("%d ",TKN_LOGICVAL);}
"E"                     {printf("%d ",TKN_LOGICVAL);}
"T"                     {printf("%d ",TKN_LOGICVAL);}
"F"                     {printf("%d ",TKN_LOGICVAL);}



%%

main()
{
   //yyin = fopen("prueba.txt", "r");
   yylex();
}
