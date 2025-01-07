#include <stdio.h>
#include <string.h>

int main()
{
    extern int _ft_atoi_base(const char* str, const char* base);

    printf("val : %d\n", _ft_atoi_base("FF", "0123456789ABCDEF"));
    return 0;
}
