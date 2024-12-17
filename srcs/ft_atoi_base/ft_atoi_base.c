// 10 진수 까지만 가능
int ft_atoi_base(const char* s, int base)
{
    long long   integer;
    int         sign;

    integer = 0;
    sign = 1;
    if (s == 0)
        return -1;
    while (*s && *s == ' ')
        s++;
    while (*s && (*s == '+' || *s =='-'))
        if (*s++ == '-')
            sign *= -1;
    while (*s >= '0' && *s <= '0' + base - 1)
        integer = integer * base + *s++ - '0';
    return integer * sign;
}

#include <stdio.h>

int main()
{
    int integer = ft_atoi_base("FF", 16);
    printf("value :%d\n", integer);
    return 0;
}