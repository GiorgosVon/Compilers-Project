digit   	[0-9]
int		    [0-9]+
float		[0-9]+\.[0-9]+
alpha		[a-zA-Z]
word		{alpha}+
variable	({word}|"_")+({word}|"_"|{int})*
id          [a-zA-Z_][a-zA-Z_0-9]*
whitespace  [ \t\r\v\f]



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
