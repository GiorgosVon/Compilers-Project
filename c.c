PROGRAM program 

STRUCT struct1
VARS INT var65,var4[50],var3453;
ENDSTRUCT 

FUNCTION function(INT a,INT b)
VARS INT var1,var2,var45[10],var46;
VARS CHAR var24,var[20]; 

/* sxolio */

IF(a<1) THEN
B=2;
ELSEIF 
B=3;
ELSEIF
B=4;
ELSE 
B=5;
ENDIF



SWITCH(b)
CASE (1):
c=1;
CASE (2):
c=2;
CASE (3):
c=3;
DEFAULT:
c=4;
ENDSWITCH

WHILE (var10<30)
var5 = function1(var1,var2);
PRINT("print execution"[,var5]);

%sxolia

PRINT("HELLO WORLD"[,var5]);
ENDWHILE

FOR counter=1 TO 200 STEP 5
var25=var4;
PRINT("for executing"[,var25]);
ENDFOR

%sxolia

IF(a<1) THEN
BREAK; 
ELSE 
VAR67=30;
ENDIF

RETURN b;
END_FUNCTION

FUNCTION function2(INTEGER a,INTEGER b)
VARS INTEGER var1,var2,var45[10],var46;
RETURN b;
END_FUNCTION




STARTMAIN 
VARS INT var100;
var100=20;
function(a,b);
ENDMAIN