#include <stdio.h>
#include <string.h>

int main()
{
    extern int ft_atoi_base(const char* str, const char* base);

    printf("val : %d\n", ft_atoi_base("    +3611006", "01234567"));
    return 0;
}
