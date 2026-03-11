#include <stdio.h>

int main(void) {
    int login, password;

    printf(" ---------------------\n");
    printf(" ----- CRACKME 4 -----\n");
    printf(" ---------------------\n");

    printf("Login : ");
    scanf("%d", &login);

    printf("Password : ");
    scanf("%d", &password);

    if (login == 77 && password == 99) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
