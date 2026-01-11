%{
#include <stdio.h>
#include "parser.tab.h"
int line_num = 1; 
%}

%option noyywrap

%%

\n                  { line_num++; }
[ \t]+              { /* ignore space */ }
"##"[^\n]* { /* ignore comments */ }
"/-"(.|\n)*?"-/"    { /* ignore multi comments exactly as provided */ }
^"#"[^\n]* { /* ignore headers */ }

"ginti"             { return GINTI; }
"isharia"           { return ISHARIA; }
"lafz"              { return LAFZ; }
"jhanda"            { return JHANDA; }
"jay"               { return JAY; }
"nahito"            { return NAHITO; }
"jadontak"          { return JADONTAK; }
"chakkar"           { return CHAKKAR; }
"agaychalo"         { return AGAYCHALO; }
"roko"              { return ROKO; }
"moro"              { return MORO; }
"wikhao"            { return WIKHAO; }
"mukh"              { return MUKH; }
"sach"              { return SACH; }
"jhoot"             { return JHOOT; }

"+="                { return PlusEqualto; }
"=="                { return double_equal; }
"+"                 { return '+'; }
"*"                 { return '*'; }
"/"                 { return '/'; }
"="                 { return '='; }
"<"                 { return '<'; }
">"                 { return '>'; }
"%"                 { return '%'; }
";"                 { return ';'; }
","                 { return ','; }
"("                 { return '('; }
")"                 { return ')'; }
"{"                 { return '{'; }
"}"                 { return '}'; }
"["                 { return '['; }
"]"                 { return ']'; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.str_val = strdup(yytext); return id; }
[0-9]+                  { yylval.int_val = atoi(yytext); return num; }
[0-9]+\.[0-9]+          { yylval.float_val = atof(yytext); return dec; }
\"([^"\\]|\\.)*\"       { yylval.str_val = strdup(yytext); return str; }
\'([^'\\]|\\.)*\'       { yylval.str_val = strdup(yytext); return charecter; }

.                       { printf("unknown charector on line %d: %s\n", line_num, yytext); }

%%
