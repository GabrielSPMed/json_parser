
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

FALSE (false)
TRUE (true)
NULL (null)

STRING (["][a-zA-Z0-9 \n\t]*["])
NUMBER [-]?(0|([1-9][0-9]*))([.][0-9]+)?((e|E)[+-]?[0-9]+)?

%%
{FALSE}  {
    return FALSE;
}
{TRUE}  {
    return TRUE;
}
{NULL}  {
    return N;
}
{STRING}  {
    return STRING;
}
{NUMBER}  {
    return NUMBER;
}




[{] {
    return OPEN_BRACES;
}
[}] {
    return CLOSED_BRACES;
}




[[] {
    return OPEN_BRACKETS;
}
[]] {
    return CLOSED_BRACKETS;
}



[:] {
    return COLON;
}
[,] {
    return COMMA;
}

[ \n\t]* ;
. ;



%%

int yywrap() {
  return 1;
}
