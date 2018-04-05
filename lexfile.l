%option noyywrap
%{
	#include "y.tab.h"
	
%}

num [+|-]?[0-9]+("."[0-9]+)?
identifier [a-zA-Z_][a-zA-Z0-9_-]*
ID [a-zA-Z_]+
str "\""(.)*"\""
char "'"(.)*"'"
bool "true"|"false"
%%

"/*"(.|\n)*"*/"  { return MULTILINE_COMMENT}
"//"  {	return SINGLELINE_COMMENT;}
[+/*-] {return BINARY_OP;}
"++"|"--" {return UNARY;}
"+="|"-="|"*="|"/=" {return SHORT_HAND;}
"?"[a-zA-Z0-9]":" {return TERNARY;}
"=="|"<="|">="|"<"|">"|"!=" {return REL_OPR;}
"&&"|"||"|"&"|"|"|"!" {return LOGICAL_OPR;}
= {return ASSIGN;}
"<<"|">>" {return BITWISE;}
"\." {return DOT;}
{identifier}"\["[0-9]*"\]" {return ARRAY;}
"import java."{identifier}("\."([a-zA-Z]+|"\*"))? {return IMPORT;}
"interface" {return INTERFACE; }
"class" {return CLASS;}
{num} {return NUMERICAL;}
{str} {return STRING;}
{char} {return CHAR;}
"private"|"public"|"protected" {return ACCESS;}
"int"|"float"|"char"|"long"|"short"|"boolean"|"double"|"String"|"byte" {return DATATYPE;}
"static" {return STATIC;}
"void" {return VOID_TYPE;}
"return" {return RETURN;}
"else if"  {return ELSE_IF;}
"if" {return IF;}
"new" {return NEW;}
"main" {return MAIN;}
"else" {return ELSE;}
"switch" {return SWITCH;}
"case" {return CASE;}
"default" {return DEFAULT;}
"break" {return BREAK;}
"continue" {return CONTINUE;}
"while" {return WHILE;}
"do" {return DO;}
"for" {return FOR;}
"this" {return THIS;}
{bool} {return BOOLEAN;}
"strlen"|"strcmp"|"strcat"|"strcmpi"|"strcpy"  {return STRING_FUNCTION;}
"Character.isAlpha"|"Character.isDigit"|"Character.isLower"|"Character.isUpper"|"Character.toUpperCase"|"Character.toLowerCase"  {return CHAR_FUNCTION;}
"Math.sqrt"|"Math.sin"|"Math.floor"|"Math.pow"|"Math.cos"|"Math.tan"|"Math.abs"|"Math.ceil"|"Math.exp"|"Math.log"  { return MATH_FUNCTION;}
{identifier} {return ID;}
{identifier}"("[a-zA-Z0-9]*")" {return FUNCTION;}
"System.out.println" {return SOPLN;}
"System.out.print" {return SOP;}
\"[a-zA-Z0-9]*\" {return STMT;}
[.]*"\.readLine()" {return INPUT;}
[\n] {return ENTER;}
"(" { return OPAR;}
")" {return CPAR;}
"{" {return OB;}
"}" {return CB;}
";" {return SEMI;}
[num] {return NUM;} 
. {RETURN ERROR;}
%%

