#include <stdio.h>
#include <string.h>

int main()
{
    extern char* ft_strdup(char *str);

    printf ("value :\n");

    char *str = "HELLO ASSEMBLY";
    char *s = ft_strdup(str);

    s[0] = '1';
    s[1] = '2';
    s[2] = 0;
    strcpy(s, str);
    

    printf ("value :%s\n", s);


    return 0;
}