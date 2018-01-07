lab:makeTree.o  syntax.tab.o
	cc -o lab makeTree.o syntax.tab.o 
tree.o: makeTree.c
	cc -c makeTree.c
syntax.tab.o:syntax.tab.c
	cc -c syntax.tab.c
syntax.tab.c lex.yy.c:syntax.y lex2.l
	bison -d syntax.y
	flex lex2.l
clean:
	rm makeTree.o syntax.tab.c syntax.tab.o syntax.tab.h lex.yy.c 
