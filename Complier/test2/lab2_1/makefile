lab:makeTree.o  syntax.tab.o makeSymbal.o
	cc  -Wall -o lab makeTree.o makeSymbal.o syntax.tab.o 
makeSymbal.o: makeSymbal.c
	cc -Wall -c makeSymbal.c
makeTree.o: makeTree.c
	cc -Wall -c makeTree.c
syntax.tab.o:syntax.tab.c
	cc -Wall -c syntax.tab.c
syntax.tab.c lex.yy.c:syntax.y lex2.l
	bison -d syntax.y
	flex lex2.l
clean:
	rm makeTree.o syntax.tab.c syntax.tab.o syntax.tab.h lex.yy.c makeSymbal.o
