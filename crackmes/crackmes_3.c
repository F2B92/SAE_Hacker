#include <stdio.h>
#include <string.h>

int main(void) {
    char login[64];
    char password[64];

    printf(" ---------------------\n");
    printf(" ----- CRACKME 3 -----\n");
    printf(" ---------------------\n");

    printf("Login : ");
    scanf("%63s", login);

    printf("Password : ");
    scanf("%63s", password);

    if (strcmp(login, "XahHaf1J") == 0 && strcmp(password, "Fae9v") == 0) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
