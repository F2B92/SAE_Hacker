#include <stdio.h>
#include <string.h>

int check_pal(const char *s) {
    int i = 0;
    int j = (int)strlen(s) - 1;

    while (i < j) {
        if (s[i] != s[j]) {
            return 0;
        }
        i++;
        j--;
    }
    return 1;
}

int main(int argc, char **argv) {
    puts(" ---------------------");
    puts(" ----- CRACKME 7 -----");
    puts(" ---------------------");

    if (argc != 2) {
        puts("Missing password !");
        return 1;
    }

    if (check_pal(argv[1])) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
