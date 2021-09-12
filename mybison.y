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

%token PROGRAM
%token VARS FUNCTION STARTMAIN ENDMAIN WORD END_FUNCTION
%token INT NEWLINE RETURN SEMICOLON STRUCT ENDSTRUCT
%token L_PAR R_PAR COMMENT WHILE ENDWHILE FOR ENDFOR 
%token IF THEN ENDIF SWITCH ENDSWITCH COLON DEFAULT 
%token ELSEIF ELSE CASE PRINT DITTOS L_BRACKET TO STEP
%token R_BRACKET BREAK COMMA TYPEDEF ASSIGN_OPERATOR
%token AND OR COMPAREOPERATORS SUM MUL CHAR

%type <a> WORD
%type <i> INT


%union {
    char *a;
    int i;
}



%%

program:                PROGRAM WORD newline declerations spaces mainDecleration;
declerations:           structDecleration spaces decl | declerations spaces decl | decl | structDecleration | /* empty */;
decl:                   functionDecleration;
functionDecleration:    FUNCTION WORD L_PAR parameters R_PAR NEWLINE statements spaces RETURN expressions SEMICOLON NEWLINE END_FUNCTION { printf("Function creation\n"); };
mainDecleration:        STARTMAIN spaces statements spaces ENDMAIN { printf("Main \n"); };
structDecleration:      structDecleration spaces struct | struct;
struct:                 STRUCT WORD NEWLINE variables spaces ENDSTRUCT { printf("Struct decleration\n"); } 
                        | TYPEDEF STRUCT WORD NEWLINE variables spaces WORD ENDSTRUCT { printf("Struct \n"); };

statements:             statements spaces statement | statement | ;
statement:              variable | expression | loop_statement | if_statement | switch | print | break | COMMENT { printf("Comments\n"); };
loop_statement:         WHILE L_PAR WORD condition expressions R_PAR NEWLINE statements NEWLINE ENDWHILE { printf("While decleration\n"); } 
| FOR WORD ASSIGN_OPERATOR INT TO INT STEP INT NEWLINE statements NEWLINE ENDFOR { printf("For decleration\n"); };
if_statement:           IF L_PAR WORD condition expressions R_PAR THEN NEWLINE statements NEWLINE ENDIF { printf("If \n"); }
                        | IF L_PAR WORD condition expressions R_PAR THEN NEWLINE statements NEWLINE elseif NEWLINE ELSE NEWLINE statements NEWLINE ENDIF { printf("If \n"); }
                        | IF L_PAR WORD condition expressions R_PAR THEN NEWLINE statements NEWLINE ELSE statements NEWLINE ENDIF  { printf("If decleration\n"); };
elseif:                 elseif NEWLINE ELSEIF NEWLINE statement | ELSEIF NEWLINE statement ;
switch:                 SWITCH L_PAR WORD R_PAR NEWLINE case NEWLINE statements ENDSWITCH { printf("Switch decleration\n"); } 
                        | SWITCH L_PAR WORD R_PAR NEWLINE case NEWLINE DEFAULT COLON NEWLINE statements NEWLINE ENDSWITCH { printf("Switch \n"); };
case:                   case NEWLINE CASE L_PAR expressions R_PAR COLON NEWLINE statement | CASE L_PAR expressions R_PAR COLON NEWLINE statement;

print:                  PRINT L_PAR DITTOS txt DITTOS R_PAR SEMICOLON { printf("Something was printed\n"); } 
                        | PRINT L_PAR DITTOS txt DITTOS L_BRACKET COMMA WORD R_BRACKET R_PAR SEMICOLON { printf("Something was printed \n"); };


variables:              variables variable | variable | ;
spaces:                 spaces newline | spaces space | newline | space;
newline:                newline NEWLINE | NEWLINE; 
space:                  space empty | empty;
empty:                  /* empty */;
txt:                    txt WORD | WORD;
break:                  BREAK SEMICOLON ;
condition:              AND | OR | COMPAREOPERATORS;
expression:             vardecleration ASSIGN_OPERATOR expression | right_hand_expression;
right_hand_expression:  funcall | expressions;
expressions:            INT | WORD | SUM | MUL | L_PAR | R_PAR | expressions SEMICOLON;
funcall:                WORD L_PAR arguments R_PAR SEMICOLON;
arguments:              arguments COMMA WORD | WORD;
parameters:             parameters COMMA parameters_list | parameters_list;
parameters_list:        type WORD;
variable:               VARS type vardeclerations SEMICOLON { printf("Variable declerations\n"); };
type:                   INT | CHAR;
vardeclerations:        vardeclerations COMMA varDeclInit | varDeclInit;
varDeclInit:            vardecleration;
vardecleration:         WORD | WORD L_BRACKET INT R_BRACKET;



%% 

int yyerror(char *s) {
    fprintf(stderr, "%s in line %d\n", s, yylineno);
    return 0;
}

int main(int argc, char **argv) {
    printf("C Parser\n\n");
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yyparse();
    return 0;
}