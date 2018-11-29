%{
	#include "hextodec.tab.h"
	int lineno=0;
%}
%option noyywrap

%%
[ \t]	;
\n 		{lineno++;}
[0-9]	{yylval.ival=(int)yytext[0]-48;return HEXDIGIT;}
[A-F]	{yylval.ival=(int)yytext[0]-55;return HEXDIGIT;}
; 		{return ';';}
%%
