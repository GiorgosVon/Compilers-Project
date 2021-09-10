/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    VARS = 259,
    FUNCTION = 260,
    STARTMAIN = 261,
    ENDMAIN = 262,
    WORD = 263,
    END_FUNCTION = 264,
    INT = 265,
    NEWLINE = 266,
    RETURN = 267,
    SEMICOLON = 268,
    STRUCT = 269,
    ENDSTRUCT = 270,
    L_PAR = 271,
    R_PAR = 272,
    COMMENT = 273,
    WHILE = 274,
    ENDWHILE = 275,
    FOR = 276,
    ENDFOR = 277,
    IF = 278,
    THEN = 279,
    ENDIF = 280,
    SWITCH = 281,
    ENDSWITCH = 282,
    COLON = 283,
    DEFAULT = 284,
    ELSEIF = 285,
    ELSE = 286,
    CASE = 287,
    PRINT = 288,
    DITTOS = 289,
    L_BRACKET = 290,
    TO = 291,
    STEP = 292,
    R_BRACKET = 293,
    BREAK = 294,
    COMMA = 295,
    TYPEDEF = 296,
    ASSIGN_OPERATOR = 297,
    AND = 298,
    OR = 299,
    COMPAREOPERATORS = 300,
    SUM = 301,
    MUL = 302,
    CHAR = 303
  };
#endif
/* Tokens.  */
#define PROGRAM 258
#define VARS 259
#define FUNCTION 260
#define STARTMAIN 261
#define ENDMAIN 262
#define WORD 263
#define END_FUNCTION 264
#define INT 265
#define NEWLINE 266
#define RETURN 267
#define SEMICOLON 268
#define STRUCT 269
#define ENDSTRUCT 270
#define L_PAR 271
#define R_PAR 272
#define COMMENT 273
#define WHILE 274
#define ENDWHILE 275
#define FOR 276
#define ENDFOR 277
#define IF 278
#define THEN 279
#define ENDIF 280
#define SWITCH 281
#define ENDSWITCH 282
#define COLON 283
#define DEFAULT 284
#define ELSEIF 285
#define ELSE 286
#define CASE 287
#define PRINT 288
#define DITTOS 289
#define L_BRACKET 290
#define TO 291
#define STEP 292
#define R_BRACKET 293
#define BREAK 294
#define COMMA 295
#define TYPEDEF 296
#define ASSIGN_OPERATOR 297
#define AND 298
#define OR 299
#define COMPAREOPERATORS 300
#define SUM 301
#define MUL 302
#define CHAR 303

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 27 "mybison.y"

    char *a;
    int i;

#line 158 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
