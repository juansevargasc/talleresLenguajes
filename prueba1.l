%{

/*C code*/

%}

delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
number {digit}+(\.{digit}+)?
fourDigits {digit}4

%%
if    return "GOODBYE\n";
{digit}   return "Digit!\n";
.                return "Unrecognized character";
{fourDigits}  return "four DIgits!";
%%

int yywrap(void)
{
    return 1;
}
