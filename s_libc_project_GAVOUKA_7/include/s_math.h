#ifndef S_MATH_H
#define S_MATH_H

int s_abs(int x);

typedef struct {
    int quot;
    int rem;
} div_t;

div_t s_div(int numer, int denom);

double s_pow(double base, int exp);
double s_exp(double x);

#endif
