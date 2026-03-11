#include <stdio.h>

int main(void) {
    int login;
    int password;

    puts(" ---------------------");
    puts(" ----- CRACKME 5 -----");
    puts(" ---------------------");

    printf("Login : ");
    if (scanf("%d", &login) != 1) {
        puts("Incorrect login type");
        return 1;
    }

    printf("Password : ");
    if (scanf("%d", &password) != 1) {
        puts("Incorrect password type");
        return 2;
    }

    if (login == 145 && password == 954) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
