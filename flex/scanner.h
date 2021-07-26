
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

#define ARRAY 1
#define ELSE 2
#define IF 3
#define OF 4
#define PROC 5
#define REF 6
#define TYPE 7
#define VAR 8
#define WHILE 9

#define SEMICOL 10

#define LPAREN 17
#define IDENT 27
#define INTLIT 28







