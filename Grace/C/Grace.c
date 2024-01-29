#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define X "#include <stdio.h>%c#define obfuscated int m##a##i##n()%c#define u char *str=%c%s%c%cobfuscated{//this comment complies with the subject%c"
#define C int f=open("Grace_output.c", O_CREAT | O_WRONLY, 0640);dprintf(f,X,10,10,32,X,32,10,10);close(f);
#define O int m##a##i##n(){C}
O//this comment complies with the subject