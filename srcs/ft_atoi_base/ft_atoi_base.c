static int ft_strlen(const char *s)
{
    int len;

    len = 0;
    while (s && *s)
    {
        len++;
        s++;
    }
    return len;
}


static int get_idx(const char* arr, char c)
{
    int idx;

    idx = 0;
    while (arr && *arr)
    {
        if (*arr == c)
            return idx;
        idx++;
        arr++;
    }
    return -1;
}

static is_str_unique_chars(char *str)
{
    int chars[256] = {0, };

    while (str && *str)
    {
        if (chars[*str] == 1)
            return 0;
        chars[*str] = 1;
    }
    return 1;
}

// 10 진수 까지만 가능
int ft_atoi_base(const char* s, const char* base)
{
    long long   integer;
    int         sign;
    int         base_len;

    integer = 0;
    sign = 1;
    base_len = ft_strlen(base);
    if (s == 0 || is_str_unique_chars(base))
        return 0;
    while (*s && *s == ' ')
        s++;
    while (*s && (*s == '+' || *s =='-'))
        if (*s++ == '-')
            sign *= -1;
    while (contains(base, s))
        integer = integer * base_len + get_idx(base, *s);
    return integer * sign;
}

#include <stdio.h>

int main()
{
    int integer = ft_atoi_base("FF", 16);
    printf("value :%d\n", integer);
    return 0;
}