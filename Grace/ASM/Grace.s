section .rodata	;mandatory comment
file db "Grace_asm_output.txt", 0
s db "section .data	;mandatory comment%cfile db %cGrace_asm_output.txt%c, 0%cX db %c%s%c%csection .text%cextern dprintf%cextern exit%cglobal _start%c%c%macro code 0%cmov	rax,2			;this is the syscall for open%cmov rdi,file		;this is the file to be opened%c;be aware flags and mods are octal values stored on an int%c;next we need the flag it is stored on an 8 byte flag value%c	;O_WRONLY defined as 1o%c	;O_CREATE defined as 100o%c	;we need both so... 101o%cmov rsi, 0101o%c;because we are using open we also need the mode arg.%c	;these are the same as octal values in chmod so we want 640 here%cmov rdx, 0640o%csyscall%ccmp rax, 0		;checking return of open%cjs quit%cpush rbp%cpush rax%c;dprintf here%cmov rdi,rax%cmov rsi,X%cmov rdx,10%cmov rcx,34%cmov r8,X%cmov r9,34%c;adding \ns%cws:push 10%cloop ws%cmov rcx,s%cxor rax,rax%ccall dprintf wrt ..plt%cmov rcx,26%csa:pop rax%cloop sa%cpop rcx%c;close and end%cpop rdi%cmov rax, 3		;preparing close syscall%csyscall			;calling close%cpop rax%cpop rbp%cquit%c%endmacro%c%c%macro quit 0%c	mov rax, 60		;preparing to call exit%c	mov rdi, 0		;return code 0%c	syscall			;calling exit%c%endmacro%c%c_start:%c	code	;open file and stores fd in rax", 10, 0
section .text
extern dprintf
extern exit
global _start

%macro code 0
mov	rax,2			;this is the syscall for open
mov rdi,file		;this is the file to be opened
;be aware flags and mods are octal values stored on an int
;next we need the flag it is stored on an 8 byte flag value
	;O_WRONLY defined as 1o
	;O_CREATE defined as 100o
	;we need both so... 101o
mov rsi, 0101o
;because we are using open we also need the mode arg.
	;these are the same as octal values in chmod so we want 640 here
mov rdx, 0640o
syscall
cmp rax, 0		;checking return of open
js quit
push rbp
push rax
;dprintf here
mov rdi,rax
mov rsi,s
mov rdx,10
;mov rcx,34
mov r8,34
mov r9,10
push 34
push s
push 34
;adding \ns
mov rcx,56
ws:push 10
loop ws
mov rcx,34
xor rax,rax
call dprintf wrt ..plt
mov rcx,59
sa:pop rax
loop sa
;close and end
pop rdi
pop rbp
mov rax,3		;preparing close syscall
syscall			;calling close
quit:
mov rax,60		;preparing to call exit
mov rdi,0		;return code 0
syscall			;calling exit
%endmacro

_start:
	code	;open file and stores fd in rax
