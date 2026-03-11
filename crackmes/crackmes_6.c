#include <stdio.h>

int main(void) {
    int login;
    int password;

    puts(" ---------------------");
    puts(" ----- CRACKME 6 -----");
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

    if (login == password) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
