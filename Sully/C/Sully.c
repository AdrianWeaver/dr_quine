#include <string.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
int main(int ac,char**av,char**env){(void)ac;(void)av;char str[32];int fd;
int recurs=5;
char*q="#include <string.h>%c#include <unistd.h>%c#include <string.h>%c#include <fcntl.h>%c#include <stdio.h>%c#include <stdlib.h>%c#include <sys/wait.h>%cint main(int ac,char**av,char**env){(void)ac;(void)av;char str[32];int fd;%cint recurs=%d;%cchar*q=%c%s%c;%cpid_t pid,wpid;%cif(recurs==0){exit(0);}%csprintf(str,%cSully%%d.c%c,recurs);%cfd=open(str,O_WRONLY|O_CREAT|O_TRUNC,0640);%cdprintf(fd,q,10,10,10,10,10,10,10,10,recurs-1,10,34,q,34,10,10,10,34,34,10,10,10,10,10,10,10,10,34,34,10,34,34,34,34,34,34,10,10,10);%cclose(fd);%cpid=fork();%cif(pid==-1){exit(0);}%cif(pid!=0){int wstatus;char*null=NULL;%cwpid=waitpid(pid,&wstatus,0);%cexecve(%c./Sully%c,&null,env);}%celse{char*ptr[5]={%c/bin/gcc%c,str,%c-o%c,%cSully%c,NULL};%cexecve(ptr[0],ptr,env);}%creturn(0);}";
pid_t pid,wpid;
if(recurs==0){exit(0);}
sprintf(str,"Sully%d.c",recurs);
fd=open(str,O_WRONLY|O_CREAT|O_TRUNC,0640);
dprintf(fd,q,10,10,10,10,10,10,10,10,recurs-1,10,34,q,34,10,10,10,34,34,10,10,10,10,10,10,10,10,34,34,10,34,34,34,34,34,34,10,10,10);
close(fd);
pid=fork();
if(pid==-1){exit(0);}
if(pid!=0){int wstatus;char*null=NULL;
wpid=waitpid(pid,&wstatus,0);
execve("./Sully",&null,env);}
else{char*ptr[5]={"/bin/gcc",str,"-o","Sully",NULL};
execve(ptr[0],ptr,env);}
return(0);}