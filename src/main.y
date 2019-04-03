

%{
    #include <stdio.h>
    #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}
%token FALSE TRUE N STRING NUMBER OPEN_BRACES CLOSED_BRACES OPEN_BRACKETS CLOSED_BRACKETS COMMA COLON

%left FALSE TRUE N STRING NUMBER
%left OPEN_BRACKETS CLOSED_BRACKETS
%left OPEN_BRACES CLOSED_BRACES
%left COMMA
%left COLON

%%
PROGRAMA:
    PROGRAMA VALUE { printf("VALIDO\n"); }
|
;
KEYPAIR:
    STRING COLON STRING {$$ = $1;
    }
|
    STRING COLON NUMBER {$$ = $1;
    }
|
    STRING COLON TRUE {$$ = $1;
    }
|
    STRING COLON FALSE {$$ = $1;
    }
|
    STRING COLON N {$$ = $1;
    }
|
    STRING COLON VALUE {$$ = $1;
    }
|
    KEYPAIR COMMA KEYPAIR {$$ = $1;
    }
;

VALUE:
    STRING {$$ = $1;
    }
|
    NUMBER {$$ = $1;
    }
|
    TRUE {$$ = $1;
    }
|
    FALSE {$$ = $1;
    }
|
    N {$$ = $1;
    }
|
    VALUE COMMA VALUE {$$ = $1;
    }
|
    OPEN_BRACES KEYPAIR CLOSED_BRACES {$$ = $2;
    }
|
    OPEN_BRACKETS VALUE CLOSED_BRACKETS {$$ = $2;
    }
|
    OPEN_BRACKETS CLOSED_BRACKETS {$$ = $2;
    }
|
    OPEN_BRACES KEYPAIR CLOSED_BRACES {$$ = $2;
    }
;

%%

void yyerror(char *s) {
    printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}

