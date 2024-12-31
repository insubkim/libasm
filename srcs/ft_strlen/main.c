#include <stdio.h>
#include <string.h>

int main()
{
    extern size_t ft_strlen(char *str);

    char *str = "HELLO ASSEMBLY";
    size_t ft_len = ft_strlen(str);
    size_t len = strlen(str);

    printf("return ft_len :%ld\n", ft_len);
    printf("return len :%ld\n", len);


    return 0;
}
