
%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

extern FILE *yyin;
extern FILE **yyout;
extern char* yytext;
extern int yylineno;
extern int lineno;	
						
%}

%start PROGRAM
%token VARS FUNCTION STARTMAIN ENDMAIN WORD 
%token INT NEWLINE RETURN SEMICOLON STRUCT ENDSTRUCT
%token L_PAR R_PAR COMMENT WHILE ENDWHILE FOR ENDFOR 
%token IF THEN ENDIF
%token ELSEIF
%token ELSE
%token ENDIF
%token SWITCH
%token CASE
%token ENDSWITCH
%token FOR
%token WHILE
%token PRINT
%token BREAK
%token %

%type <a> WORD
%type <i> INT


%%

program:                PROGRAM WORD newline declerations spaces mainDecleration;
declerations:           structDecleration spaces functionDecleration | declerations spaces functionDecleration | functionDecleration | structDecleration | ;
functionDecleration:    FUNCTION WORD L_PAR parameters R_PAR NEWLINE statements spaces RETURN expressions SEMICOLON NEWLINE END_FUNCTION { printf("Function creation"); };
mainDecleration:        STARTMAIN spaces statements spaces ENDMAIN { printf("Main \n"); };
structDecleration:      structDecleration spaces struct | struct;
struct:                 STRUCT WORD NEWLINE variables spaces ENDSTRUCT { printf("Struct \n"); } | TYPEDEF STRUCT WORD NEWLINE variables spaces WORD ENDSTRUCT { printf("Struct \n"); };

statements:             statements spaces statement | statement | ;
statement:              variable | expression | loop_statement | if_statement | switch | print | break | COMMENT { printf("Comment\n"); };
loop_statement:         WHILE L_PAR WORD condition expressions R_PAR NEWLINE statements NEWLINE ENDWHILE { printf("While\n"); } | FOR WORD ASSIGN_OPERATOR INT TO INT STEP INT NEWLINE statements NEWLINE ENDFOR { printf("For \n"); };
if_statement:           IF L_PAR WORD condition expressions R_PAR THEN NEWLINE statements NEWLINE ENDIF { printf("If \n"); }
                        | IF L_PAR WORD condition expressions R_PAR THEN NEWLINE statements NEWLINE elseif NEWLINE ELSE NEWLINE statementes NEWLINE ENDIF { printf("If \n"); }

variables:              variables variable | variable | ;

parameters:

spaces: 

newline:                newline NEWLINE | NEWLINE; 



functions: function
        |function functions
        ;

function: FUNCTION id '(' VARS vars')' RETURN end_function
        |FUNCTION id '(' VARS vars')' body RETURN end_function
        ;

startmain_endmain: STARTMAIN id '(' VARS vars')' body ENDMAIN
        ;

vars: CHAR variables
      | INTEGER variables
      ;

variables: variable
        | variable ',' variable
        ;

variable:   id
        | id '[' int ']'
        ;

body:   stmt 
        |stmt body
        ; 

stmt: assignment
        |loop_stmt
        |check_stmt
        |print
        |break
        |comments
        ;

loop_stmt: while_loop
        |for_loop
        ;

check_stmt: if_stmt
        |switch_stmt
        ;

assignment: variable '=' right_hand_side 
        ;

right_hand_side: variable
                | int
                | char
                | <ar_expression>
                | id '(' VARS ')'      
                | variable operator variable
                ;

while_loop: WHILE '(' boolean_stmt ')' body ENDWHILE
        ;

for_loop: FOR assignment TO int STEP int body ENDFOR
        ;

if_stmt: IF '(' boolean_stmt ')' THEN body ENDIF
        |IF '(' boolean_stmt ')' THEN body ELSE body ENDIF
        |IF '(' boolean_stmt ')' THEN body elseif ELSE body ENDIF
        ;

elseif: ELSEIF '(' <boolean_stmt> ')' body
        |ELSEIF '(' <boolean_stmt> ')' body elseif
        ;

switch_stmt: SWITCH '(' variable ')' case ENDSWITCH
        |SWITCH '(' <variable> ')' case DEFAULT '(' <variable> ')' ENDSWITCH
        ;

case: CASE '(' variable ')' body
        | CASE '(' <variable ')' body case
        ;

print: PRINT '(' string , <variable> ')' ;
        ;

break: BREAK 
        ;

comments: %string
        ;

boolean_stmt:  variable unary-operator variable
        |variable unary-operator variable boolean_stmt
        ;

ar_expression: int
	|ar_expression operator ar_expression
        |'(' ar_expression operator ar_expression ')'
        ;

operator: '*'
        |'/'
        | '%'
        | '+'
        | '-'
        | '^'
        ;


unary-operator: 'AND'
                | 'OR'
                | '!='
                | '=='
                | '<'
                | '>'
                ;

%%