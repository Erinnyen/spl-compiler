
flex scanner.flex
gcc lex.yy.c -o bin/scanner.out
./bin/scanner.out spl-code/scantest.spl
