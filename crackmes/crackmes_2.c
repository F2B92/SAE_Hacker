#include <stdio.h>
#include <string.h>

int main(void) {
    char login[64];
    char password[64];

    printf(" ---------------------\n");
    printf(" ----- CRACKME 2 -----\n");
    printf(" ---------------------\n");

    printf("Login : ");
    scanf("%63s", login);

    printf("Password : ");
    scanf("%63s", password);

    if (strcmp(login, "du6Thoo7") == 0 && strcmp(password, "EW8ingoh") == 0) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
