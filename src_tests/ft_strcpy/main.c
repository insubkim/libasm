#include <stdio.h>
#include <string.h>

int main()
{
    extern char* ft_strcpy(char *s1, char* s2);

    {
        char s1[128] = {0, };
        char s2[128] = {0, };
        for (int i = 0; i < 127; i++)
            s2[i] = 'A';
        // char *s2 ="H";
        printf("ft_strcpy :%s\n", ft_strcpy(s1, s2));
        printf("strcpy :%s\n", strcpy(s1, s2));
    }

    {
        char s1[128] = {0, };
        char *s2 ="HH";
        printf("ft_strcpy :%s\n", ft_strcpy(s1, s2));
        printf("strcpy :%s\n", strcpy(s1, s2));
    }

    {
        char s1[128] = {0, };
        char *s2 ="";
        printf("ft_strcpy :%s\n", ft_strcpy(s1, s2));
        printf("strcpy :%s\n", strcpy(s1, s2));
    }

    {
        char s1[128] = {'A', };
        char *s2 ="";
        printf("ft_strcpy :%s\n", ft_strcpy(s1, s2));
        printf("strcpy :%s\n", strcpy(s1, s2));
    }
    return 0;
}
