.text

###############################################################################
# int s_puts(const char *s)
###############################################################################
.global s_puts
.extern putchar

s_puts:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %ebx

    movl 8(%ebp), %esi      # esi = s
    xorl %ebx, %ebx         # i = 0

.Lputs_loop:
    movzbl (%esi,%ebx,1), %eax   # eax = s[i]

    cmpb $0, %al                 # si s[i] == '\0'
    je .Lputs_fin

    pushl %eax
    call putchar
    addl $4, %esp

    incl %ebx
    jmp .Lputs_loop

.Lputs_fin:
    pushl $10                    # '\n'
    call putchar
    addl $4, %esp

    movl $1, %eax               # return 1

    popl %ebx
    popl %esi
    popl %ebp
    ret
