%{

#include <stdio.h>
#include <string.h>
#include "y.tab.h"

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
DITTOS      ["]




%%

"PROGRAM"       {return (PROGRAM); }
"VARS"          {return (VARS); }
"FUNCTION"      {return (FUNCTION); }
"END_FUNCTION"  {return (END_FUNCTION); }
"INT"  		    {return (INT);}
"STARTMAIN"     {return (STARTMAIN); }
"ENDMAIN"       {return (ENDMAIN); }
"RETURN"        {return (RETURN); }
"STRUCT"        {return (STRUCT); }
"ENDSTRUCT"     {return (ENDSTRUCT); }
"WHILE"         {return (WHILE); }
"ENDWHILE"      {return (ENDWHILE); }
"FOR"		    {return (FOR); }
"ENDFOR"        {return (ENDFOR); }
"IF"		    {return (IF); }
"THEN"          {return (THEN); }
"ENDIF"         {return (ENDIF); }
"SWITCH"        {return (SWITCH); }
"ENDSWITCH"     {return (ENDSWITCH); }
"DEFAULT"       {return (DEFAULT); }
"ELSEIF"        {return (ELSEIF); }
"ELSE"		    {return (ELSE); }
"CASE"          {return (CASE); }
"PRINT"         {return (PRINT); }
"TO"            {return (TO); }
"STEP"          {return (STEP); }
"BREAK"         {return (BREAK); }
"TYPEDEF"       {return (TYPEDEF); }
"="             {return (ASSIGN_OPERATOR); }
"CHAR"  	    {return (CHAR); }


{DIGITS}        { yylval.i = atoi(yytext); return INT; }
{WORD}          {yylval.a = yytext; return WORD; }
{COMMENT}       {return (COMMENT); }
{SUM}           {return (SUM); }
{MUL}           {return (MUL); }
{DITTOS}        {return (DITTOS); }

"\n"                            {return (NEWLINE); }
";"                             {return (SEMICOLON); }
")"                             {return (R_PAR); }
"("                             {return (L_PAR); }
":"                             {return (COLON); }
"["                             {return (L_BRACKET); }
"]"                             {return (R_BRACKET); }
","                             {return (COMMA); }
"&&"                            {return (AND); }
"||"                            {return (OR); }
"<"|">"|"=="|"!="|"<="|">="     {return (COMPAREOPERATORS); }

.                                       { showError(); }
"/*"                                    {BEGIN(MULTILINE_COMMENT);}
<MULTILINE_COMMENT>\n|\r\n|\r           {lineno++;}
<MULTILINE_COMMENT>.                    {}
<MULTILINE_COMMENT>"*/"                 {BEGIN(INITIAL);}



%%

void showError() {
    // printf("Unrecognized token\n");
}

