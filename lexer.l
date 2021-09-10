%{

#include <stdio.h>
#include <string.h>

int lineno = 1; 

void showError();


%}

%option noyywrap yylineno

%x comments
%x MULTILINE_COMMENT

DIGITS  	([0-9])+
WORD        ([a-zA-Z0-9_])+
COMMENT     "%".*
SUM         [-+]
MUL         [/^*]
MARKS       ["]




%%


"INT"  		{return (INT);}
"FLOAT" 	{return (FLOAT);}
"CHAR"  	{return (CHAR);}
"IF"		{return (IF);}
"ELSEIF"    {return (ELSEIF);}
"ELSE"		{return (ELSE);}
"ENDIF"     {return (ENDIF);}
"SWITCH"    {return (SWITCH);}
"CASE"      {return (CASE);}
"ENDSWITCH" {return (ENDSWITCH);}
"FOR"		{return (FOR);}
"WHILE"     {return (WHILE);}
"PRINT"     {return (PRINT);}
"BREAK"     {return (BREAK);}
"%"         {return (COMMENT);}
"PROGRAM"   {return (PROGRAM);}
"FUNCTION"  {return (FUNCTION);}
"VARS"      {return (VARS);}

","		{return ',';}
"+"		{return '+';}
"-"     {return '-';}
"*"		{return '*';}
"/"		{return '/';}
"="		{return '=';}
"!"		{return '!';}
"<"		{return '<';}
">"		{return '>';}
"("		{return '(';}
")"		{return ')';}
":"		{return ':';}


%%

void showError() {
    // printf("Unrecognized token\n");
}