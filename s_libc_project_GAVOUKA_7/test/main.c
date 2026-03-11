#include <stdio.h>
#include "../include/s_string.h"
#include "../include/s_math.h"
#include "../include/s_stdio.h"

int main()
{
    printf("===== TEST STRING =====\n");

    char a[100] = "Hello";
    char b[100] = "World";
    char c[100] = {0};

    printf("strlen(\"Hello\") = %d\n", s_strlen(a));

    s_strcpy(b, "CopyTest");
    printf("strcpy -> %s\n", b);

    s_strncpy(c, "ABCDE", 3);
    printf("strncpy -> %s\n", c);

    s_strcat(a, " World");
    printf("strcat -> %s\n", a);

    s_strncat(a, " TEST", 3);
    printf("strncat -> %s\n", a);

    printf("strcmp(\"abc\",\"abc\") = %d\n", s_strcmp("abc","abc"));
    printf("strcmp(\"abc\",\"abd\") = %d\n", s_strcmp("abc","abd"));

    printf("strncmp(\"abc\",\"abd\",2) = %d\n", s_strncmp("abc","abd",2));

    char *p = s_strchr("Hello",'l');
    if (p)
        printf("strchr -> %c\n", *p);

    printf("\n===== TEST MATH =====\n");

    printf("abs(-10) = %d\n", s_abs(-10));

    div_t d = s_div(10,3);
    printf("div(10,3) -> quot=%d rem=%d\n", d.quot, d.rem);

    printf("pow(2,3) = %f\n", s_pow(2,3));

    printf("exp(1) = %f\n", s_exp(1));

    printf("\n===== TEST STDIO =====\n");

    s_puts("Hello from s_puts");

    return 0;
}
