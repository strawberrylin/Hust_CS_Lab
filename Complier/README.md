
* [Complier](#complier)  
     * [C--](#c--)  
     * [Flex](#flex)  
     * [Bison](#bison)  
     * [Makefile](#makefile)
     * [TODO-List](#todo-list)
     * [Liscense](#license)

----

# Complier

     record of the complier lab.

## C--

```c
<程序>          ::=  <分程序>

<分程序>        ::=  [<变量说明部分>] [<结构体说明部分>] [<函数说明部分>]

<类型>          ::=  int|float|struct <标识符>

<变量说明部分>  ::=  <类型> <变量定义> { ,<变量定义> } ;

<变量定义>      ::=  <标识符> {= <立即数>}

<立即数>        ::=  <integer>|<float>

<函数说明部分>  ::=  <类型><函数声明>{ <语句>{,<语句>}};

<函数声明>      ::=  <标识符> (<类型><标识符>{,<类型><标识符>})

<结构体说明部分>::=  <结构体说明>{<结构体说明>}

<结构体说明>    ::=  struct <标识符> {<变量说明部分>}

<语句>          ::=  <变量说明>|<赋值语句> | <条件语句> | <当型循环语句> | <函数调用语句>|<复合语句> | <空语句> ;

<赋值语句>      ::=  <id> = <表达式>

<复合语句>      ::=  ‘{‘ <语句> {;<语句>} ‘}’

<空语句>        ::=  ε

<条件>          ::=  <表达式> <关系运算符> <表达式> | <单目运算符><表达式>

<表达式>        ::=  [+| -] <项> { <加减运算符><项>}

<项>            ::=  <因子> {<乘除运算符><因子>}

<因子>          ::=  <id> | <立即数> |‘(’<表达式>‘)’

<单目运算符>    ::=  !| ‘|’ | ~

<加减运算符>    ::=  + | -

<乘除运算符>    ::=  * | /

<关系运算符>    ::=  = | # | < | <= | > | >=

<条件语句>      ::=  if <条件> then <语句>

<过程调用语句>  ::=  <id>(<立即数>|<标识符>{,<立即数><标识符>})

<当型循环语句>  ::=  while <条件> ‘{’ <语句> ‘}’ 
```
----

## Flex

sudo apt-get install flex

## Bison

sudo apt-get install bison

## Makefile

## TODO-List

## License

MIT License Copyright (c) 2016 [strawberrylin](https://github.com/strawberrylin)
