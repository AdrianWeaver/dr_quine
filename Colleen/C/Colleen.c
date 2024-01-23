#include <stdio.h>
void useless_function(){
//see this function? Well it's useless
return;}
int main(){//wesh
char *str="#include <stdio.h>%cvoid useless_function(){%c//see this function? Well it's useless%creturn;}%cint main(){//wesh%cchar *str=%c%s%c;%cprintf(str,10,10,10,10,10,34,str,34,10);useless_function();}";
printf(str,10,10,10,10,10,34,str,34,10);useless_function();}