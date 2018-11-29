%{
	#include<stdio.h>
	extern int lineno;
	extern int yylex();
	extern int yyparse();

	void yyerror(char*);
%}

%union{
	int ival;
}

%token <ival> HEXDIGIT 
%type<ival> number hexnum

%%
number:hexnum ';'	{$$=$1;printf("Decimal Value : %d\n",$$);}
		|number hexnum ';' 	{$$=$2;printf("Decimal Value : %d\n",$$);}
		;
hexnum:hexnum HEXDIGIT 		{$$=16*$1+$2;}
		|HEXDIGIT	{$$=$1;}
		;

%%
int main(int a,char **s)
{
	yyparse();
}		
void yyerror(char* s)
{
	printf("Syntax error : %s\n",s);
}