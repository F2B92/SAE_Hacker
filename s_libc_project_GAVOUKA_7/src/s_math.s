.text

###############################################################################
# int s_abs(int x)
###############################################################################
.global s_abs
s_abs:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %eax      # eax = x

    cmpl $0, %eax           # si eax < 0
    jge .Labs_fin

    negl %eax               # eax = -eax

.Labs_fin:
    popl %ebp
    ret


###############################################################################
# div_t s_div(int numer, int denom)
###############################################################################
.global s_div
s_div:
    pushl %ebp
    movl %esp, %ebp

    pushl %ebx

    movl 12(%ebp), %eax     # eax = numer
    movl 16(%ebp), %ebx     # ebx = denom

    cdq                     # préparation division
    idivl %ebx              # eax = quotient, edx = reste

    movl 8(%ebp), %ecx      # ecx = adresse result
    movl %eax, (%ecx)       # result.quot
    movl %edx, 4(%ecx)      # result.rem

    movl %ecx, %eax         # retourner result

    popl %ebx
    popl %ebp
    ret


###############################################################################
# double s_pow(double base, int exp)
###############################################################################
.global s_pow
s_pow:
    pushl %ebp
    movl %esp, %ebp

    subl $8, %esp           # espace pour result

    fld1                    # result = 1.0
    fstpl -8(%ebp)

    movl 16(%ebp), %ecx     # ecx = exp

.Lpow_loop:
    cmpl $0, %ecx           # si exp <= 0
    jle .Lpow_fin

    fldl -8(%ebp)           # result
    fldl 8(%ebp)            # base
    fmulp %st, %st(1)       # result *= base
    fstpl -8(%ebp)

    decl %ecx               # exp--
    jmp .Lpow_loop

.Lpow_fin:
    fldl -8(%ebp)           # return result

    leave
    ret


###############################################################################
# double s_exp(double x)
###############################################################################
.global s_exp
s_exp:
    pushl %ebp
    movl %esp, %ebp
    subl $20, %esp              # -8 term, -16 sum, -20 i

    fld1
    fstpl -8(%ebp)              # term = 1.0

    fld1
    fstpl -16(%ebp)             # sum = 1.0

    movl $1, -20(%ebp)          # i = 1

.Lexp_loop:
    cmpl $20, -20(%ebp)         # si i >= 20
    jge .Lexp_fin

    fldl -8(%ebp)               # st0 = term
    fldl 8(%ebp)                # st0 = x, st1 = term
    fmulp %st, %st(1)           # st0 = term * x

    fildl -20(%ebp)             # st0 = i, st1 = term*x
    fdivrp %st, %st(1)          # st0 = (term*x) / i
    fstpl -8(%ebp)              # term = term * x / i

    fldl -16(%ebp)              # st0 = sum
    fldl -8(%ebp)               # st0 = term, st1 = sum
    faddp %st, %st(1)           # st0 = sum + term
    fstpl -16(%ebp)             # sum = sum + term

    incl -20(%ebp)
    jmp .Lexp_loop

.Lexp_fin:
    fldl -16(%ebp)              # return sum
    leave
    ret
