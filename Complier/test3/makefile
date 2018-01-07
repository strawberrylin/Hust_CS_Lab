complier:makeTree.o  syntax.tab.o makeSymbal.o analyseSymbal.o makeIR.o main.o 
	cc -g -Wall -o complier main.o makeIR.o analyseSymbal.o makeSymbal.o makeTree.o syntax.tab.o
main.o: main.c
	cc -g -Wall -c main.c
makeIR.o: makeIR.c
	cc -g -Wall -c makeIR.c
analyseSymbal.o:analyseSymbal.c
	cc -g -Wall -c analyseSymbal.c
makeSymbal.o:makeSymbal.c
	cc -g -Wall -c makeSymbal.c
makeTree.o:makeTree.c
	cc -g -Wall -c makeTree.c
syntax.tab.o:syntax.tab.c
	cc -g -Wall -c syntax.tab.c
syntax.tab.c lex.yy.c:syntax.y lexical.l
	bison -d syntax.y
	flex lexical.l
clean:
	rm  makeTree.o syntax.tab.c syntax.tab.o makeSymbal.o main.o lex.yy.c analyseSymbal.o makeIR.o
