#include <stdio.h>
#include <ctype.h>

int check_ma(const char *s) {
    int count = 0;
    while (*s) {
        if (isupper((unsigned char)*s)) {
            count++;
        }
        s++;
    }
    return count;
}

int check_mi(const char *s) {
    int count = 0;
    while (*s) {
        if (islower((unsigned char)*s)) {
            count++;
        }
        s++;
    }
    return count;
}

int main(int argc, char **argv) {
    puts(" ---------------------");
    puts(" ----- CRACKME 8 -----");
    puts(" ---------------------");

    if (argc != 2) {
        puts("Missing password !");
        return 1;
    }

    if (check_ma(argv[1]) == check_mi(argv[1])) {
        puts("** ACCESS GRANTED **");
    } else {
        puts("** ACCESS DENIED **");
    }

    return 0;
}
