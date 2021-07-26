

//testcomment
typedef struct {
    int line;
} NoVal;

typedef struct 
{
    int line;
    int val;
} IntVal;

typedef struct 
{
    int line;
    char *val;
} StringVal;

typedef union 
{
    NoVal noVal;
    IntVal intVal;
    StringVal stringVal;
} YYSTYPE;

#define ARRAY 1         //array
#define ELSE 2          //else
#define IF 3            //if
#define OF 4            //of
#define PROC 5          //proc
#define REF 6           //ref
#define TYPE 7          //type
#define VAR 8           //var
#define WHILE 9         //while

#define LPAREN 10       // (
#define RPAREN 11       // )
#define LSQBRACK 12     // [
#define RSQBRACK 13     // ]
#define LBLOCK 14       // {
#define RBLOCK 15       // }
#define EQUAL 16        // =
#define NOTEQUAL 17     // #
#define LESS 18         // <
#define LESSEQ 19       // <=
#define GRTR 20         // >
#define GRTREQ 21       // >=
#define ASGN 22         // :=
#define COL 23          // :
#define COMMA 24        // ,
#define SEMICOL 25      // ;
#define PLUS 26         // + 
#define MINUS 27        // -
#define MULT 28         // *
#define DVSN 29         // /

#define IDENT 30
#define INTLIT 31







