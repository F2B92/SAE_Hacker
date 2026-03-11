.text

###############################################################################
# size_t s_strlen(const char *s)
###############################################################################
.global s_strlen
.type s_strlen, @function

s_strlen:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi
    xorl %eax, %eax

.Lstrlen_loop:
    movb (%esi,%eax), %dl
    cmpb $0, %dl
    je .Lstrlen_fin

    incl %eax
    jmp .Lstrlen_loop

.Lstrlen_fin:
    popl %ebp
    ret

###############################################################################
# char *s_strcpy(char *dest, const char *src)
###############################################################################
.global s_strcpy
s_strcpy:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi

    movl 8(%ebp), %edi          # edi = dest
    movl 12(%ebp), %esi         # esi = src
    movl 8(%ebp), %eax          # eax = valeur de retour = dest
    xorl %ecx, %ecx             # i = 0

.Lstrcpy_loop:
    movb (%esi,%ecx,1), %dl     # dl = src[i]
    movb %dl, (%edi,%ecx,1)     # dest[i] = src[i]

    cmpb $0, %dl                # si src[i] == '\0'
    je .Lstrcpy_fin             # fin

    incl %ecx                   # i++
    jmp .Lstrcpy_loop           # retourner à loop

.Lstrcpy_fin:
    popl %edi
    popl %esi
    popl %ebp
    ret

###############################################################################
# char *s_strncpy(char *dest, const char *src, size_t n)
###############################################################################
.global s_strncpy
s_strncpy:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi

    movl 8(%ebp), %edi          # edi = dest
    movl 12(%ebp), %esi         # esi = src
    movl 16(%ebp), %edx         # edx = n
    movl 8(%ebp), %eax          # eax = dest (retour)
    xorl %ecx, %ecx             # i = 0

.Lstrncpy_loop1:
    cmpl %edx, %ecx             # si i >= n
    jge .Lstrncpy_fin

    movb (%esi,%ecx,1), %al     # al = src[i]
    cmpb $0, %al                # si src[i] == '\0'
    je .Lstrncpy_remplissage

    movb %al, (%edi,%ecx,1)     # dest[i] = src[i]
    incl %ecx                   # i++
    jmp .Lstrncpy_loop1

.Lstrncpy_remplissage:
    cmpl %edx, %ecx
    jge .Lstrncpy_fin

    movb $0, (%edi,%ecx,1)
    incl %ecx
    jmp .Lstrncpy_remplissage

.Lstrncpy_fin:
    popl %edi
    popl %esi
    popl %ebp
    ret

###############################################################################
# char *s_strcat(char *dest, const char *src)
###############################################################################
.global s_strcat
s_strcat:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi

    movl 12(%ebp), %esi         # esi = src
    movl 8(%ebp), %edi          # edi = dest
    movl 8(%ebp), %eax          # eax = dest (retour)
    xorl %ecx, %ecx             # d = 0
    xorl %edx, %edx             # s = 0

.Lstrcat_loop1:
    cmpb $0, (%edi,%ecx,1)
    je .Lstrcat_loop2

    incl %ecx
    jmp .Lstrcat_loop1

.Lstrcat_loop2:
    movb (%esi,%edx,1), %al
    movb %al, (%edi,%ecx,1)

    cmpb $0, %al
    je .Lstrcat_fin

    incl %ecx
    incl %edx
    jmp .Lstrcat_loop2

.Lstrcat_fin:
    popl %edi
    popl %esi
    popl %ebp
    ret

###############################################################################
# char *s_strncat(char *dest, const char *src, size_t n)
###############################################################################
.global s_strncat
s_strncat:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
    pushl %ebx

    movl 12(%ebp), %esi         # esi = src
    movl 8(%ebp), %edi          # edi = dest
    movl 16(%ebp), %ebx         # ebx = n
    movl 8(%ebp), %eax          # eax = dest (retour)
    xorl %ecx, %ecx             # d = 0
    xorl %edx, %edx             # s = 0

.Lstrncat_loop1:
    cmpb $0, (%edi,%ecx,1)
    je .Lstrncat_loop2

    incl %ecx
    jmp .Lstrncat_loop1

.Lstrncat_loop2:
    cmpl $0, %ebx
    je .Lstrncat_fin_zero

    movb (%esi,%edx,1), %al
    cmpb $0, %al
    je .Lstrncat_fin_zero

    movb %al, (%edi,%ecx,1)
    incl %ecx
    incl %edx
    decl %ebx
    jmp .Lstrncat_loop2

.Lstrncat_fin_zero:
    movb $0, (%edi,%ecx,1)

.Lstrncat_fin:
    popl %ebx
    popl %edi
    popl %esi
    popl %ebp
    ret

###############################################################################
# int s_strcmp(const char *s1, const char *s2)
###############################################################################
.global s_strcmp
s_strcmp:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi

    movl 8(%ebp), %esi          # esi = s1
    movl 12(%ebp), %edi         # edi = s2
    xorl %ecx, %ecx             # i = 0

.Lstrcmp_loop1:
    movb (%esi,%ecx,1), %al     # al = s1[i]
    cmpb $0, %al                # si s1[i] == '\0'
    je .Lstrcmp_fin             # aller à fin

    cmpb (%edi,%ecx,1), %al     # si s1[i] != s2[i]
    jne .Lstrcmp_fin            # aller à fin

    incl %ecx                   # i++
    jmp .Lstrcmp_loop1          # retourner à loop1

.Lstrcmp_fin:
    movzbl (%esi,%ecx,1), %eax  # eax = (unsigned char)s1[i]
    movzbl (%edi,%ecx,1), %edx  # edx = (unsigned char)s2[i]
    subl %edx, %eax             # eax = s1[i] - s2[i]

    popl %edi
    popl %esi
    popl %ebp
    ret

###############################################################################
# int s_strncmp(const char *s1, const char *s2, size_t n)
###############################################################################
.global s_strncmp
s_strncmp:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
    pushl %ebx

    movl 8(%ebp), %esi          # esi = s1
    movl 12(%ebp), %edi         # edi = s2
    movl 16(%ebp), %ebx         # ebx = n
    xorl %ecx, %ecx             # i = 0

.Lstrncmp_loop1:
    cmpl $0, %ebx               # si n == 0
    je .Lstrncmp_fin_zero       # aller à Fin_zero

    movb (%esi,%ecx,1), %al     # al = s1[i]
    cmpb $0, %al                # si s1[i] == '\0'
    je .Lstrncmp_fin            # aller à Fin

    cmpb (%edi,%ecx,1), %al     # si s1[i] != s2[i]
    jne .Lstrncmp_fin           # aller à Fin

    incl %ecx                   # i++
    decl %ebx                   # n--
    jmp .Lstrncmp_loop1         # retourner à loop1

.Lstrncmp_fin_zero:
    xorl %eax, %eax             # retourner 0
    jmp .Lstrncmp_sortie

.Lstrncmp_fin:
    movzbl (%esi,%ecx,1), %eax  # eax = (unsigned char)s1[i]
    movzbl (%edi,%ecx,1), %edx  # edx = (unsigned char)s2[i]
    subl %edx, %eax             # eax = s1[i] - s2[i]

.Lstrncmp_sortie:
    popl %ebx
    popl %edi
    popl %esi
    popl %ebp
    ret

###############################################################################
# char *s_strchr(const char *s, int c)
###############################################################################
.global s_strchr
s_strchr:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi

    movl 8(%ebp), %esi          # esi = s
    movb 12(%ebp), %dl          # dl = c (on garde juste l'octet bas)
    xorl %ecx, %ecx             # i = 0

.Lstrchr_loop1:
    movb (%esi,%ecx,1), %al     # al = s[i]

    cmpb %dl, %al               # si s[i] == c
    je .Lstrchr_fin_trouve      # aller à Fin_trouve

    cmpb $0, %al                # si s[i] == '\0'
    je .Lstrchr_fin_zero        # aller à Fin_zero

    incl %ecx                   # i++
    jmp .Lstrchr_loop1          # retourner à loop1

.Lstrchr_fin_trouve:
    leal (%esi,%ecx,1), %eax    # retourner &s[i]
    jmp .Lstrchr_sortie

.Lstrchr_fin_zero:
    cmpb $0, %dl                # si c == '\0'
    je .Lstrchr_fin_trouve      # retourner &s[i]

    xorl %eax, %eax             # retourner NULL

.Lstrchr_sortie:
    popl %esi
    popl %ebp
    ret
