%{
#include <stdio.h>

int error_found = 0; 
extern int line_num;
extern int yylex();
extern char *yytext;
extern FILE *yyin;
extern int brace_count; 
FILE *res_file;
FILE *err_file;


void yyerror(const char *msg) {
    error_found = 1;
    if (yytext[0] == '\0') { 
        if (brace_count > 0) {
            printf("Error (Line %d):You are missing %d '}'.\n", line_num, brace_count);
            fprintf(err_file, "Error (Line %d): Unexpected End of File. Missing '}'.\n", line_num);
            return; 
        }
    }
    printf("Error (Line %d): %s. Token: '%s'\n", line_num, msg, yytext);
    fprintf(err_file, "Error (Line %d): %s. Token: '%s'\n", line_num, msg, yytext);
}
%}

%union {
    int int_val;
    float float_val;
    char *str_val;
}

%token <str_val> id str charecter
%token <int_val> num
%token <float_val> dec
%token GINTI ISHARIA LAFZ JHANDA MUKH MORO WIKHAO JAY NAHITO CHAKKAR JADONTAK AGAYCHALO ROKO SACH JHOOT PlusEqualto double_equal

%left '-' 
%left '+'
%left '*' 
%left '/' '%'

%start start

%%
start: dtype MUKH '(' ')' code { fprintf(res_file, "program done\n"); } ;

code: '{' lines '}' ;

lines: statements lines | ;

statements: make_var | assign_val | condition | loops | output | jumps | code | ';' | error ';' { yyerrok; } ;

make_var: dtype var_list ';' { fprintf(res_file, "Line %d: variable create \n", line_num); } ;

dtype: GINTI | ISHARIA | LAFZ | JHANDA ;

var_list: single_var | single_var ',' var_list ;

single_var: id | id '=' expression | id '[' num ']' | id '[' num ']' '=' '{' args '}' | JHANDA | JHANDA '=' expression ;

assign_val: term_var '=' expression ';' | term_var PlusEqualto expression ';' | term_var '=' '{' args '}' ;

condition: JAY '(' expression ')' statements | JAY '(' expression ')' statements NAHITO statements ;

loops: CHAKKAR '(' loop_part ';' check_part ';' loop_part ')' statements | JADONTAK '(' expression ')' statements ;

loop_part: term_var '=' expression | term_var PlusEqualto expression | expression | ;

check_part: expression | ;

output: WIKHAO '(' str ')' ';' | WIKHAO '(' str ',' args ')' ';' ;

args: expression | expression ',' args ;

jumps: MORO expression ';' | AGAYCHALO ';' | ROKO ';' ;

term_var: id | id '[' expression ']' | dtype | dtype '[' expression ']' ;

expression: simple | simple compare simple ;

compare: double_equal | '<' | '>' ;

simple: term | simple '+' term | simple '-' term ;

term: factor | term '*' factor | term '/' factor | term '%' factor ;

factor: term_var | num | dec | charecter | str | SACH | JHOOT | '(' expression ')' ;

%%



int main(int argc, char **argv) {
    res_file = fopen("results.txt", "w");
    err_file = fopen("errors.txt", "w");

    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        yyin = f;
        yyparse();
        
        if (error_found == 0) {
            printf("\nAnalysis Successful.\n");
            fprintf(res_file, "\nFinal Status: Syntax Analysis Successful!\n");
        } else {
            printf("\nAnalysis Failed.\n");
            fprintf(res_file, "\nFinal Status: Syntax Analysis Failed.\n");
        }
        fclose(f);
    }
    
    fclose(res_file);
    fclose(err_file);
    return 0;
}
