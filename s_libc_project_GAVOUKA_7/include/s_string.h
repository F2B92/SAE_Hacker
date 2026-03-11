#ifndef S_STRING_H
#define S_STRING_H

int s_strlen(char *str);
char *s_strcpy(char *dest, const char *src);
char *s_strncpy(char *dest, const char *src, int n);
char *s_strcat(char *dest, const char *src);
char *s_strncat(char *dest, const char *src, int n);
int s_strcmp(const char *s1, const char *s2);
int s_strncmp(const char *s1, const char *s2, int n);
char *s_strchr(const char *s, int c);

#endif
