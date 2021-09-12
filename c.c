PROGRAM program 

STRUCT struct1
VARS INT var1,var2[3],var3;
ENDSTRUCT

FUNCTION function(INT i,INT j)
VARS INT var4,var5,var6[5],var7;
VARS CHAR var8,var9[12]; 

WHILE (var10<30)
var5 = function1(var1,var2);
PRINT("print execution"[,var5]);

IF(t<1) THEN
var1=2;
ELSEIF
var1=3;
ELSEIF
var1=4;
ELSE
var1=5;
ENDIF

SWITCH(aplha)
CASE (1):
beta=1;
CASE (2):
beta=2;
CASE (3):
beta=3;
DEFAULT:
beta=4;
ENDSWITCH


%comments

PRINT("HELLO WORLD"[,var5]);
ENDWHILE

FOR counter=1 TO 30 STEP 3
PRINT("for executing"[,var3]);
ENDFOR

%sxolia

IF(a<1) THEN
BREAK; 
ELSE 
VAR16=30;
ENDIF

RETURN j;
END_FUNCTION

FUNCTION foo(INT i,INT j)
VARS INT var11,var12,var13[10],var12;
RETURN j;
END_FUNCTION


STARTMAIN
VARS INT var21;
var22=20;
function(a,b);
ENDMAIN