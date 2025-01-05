#include <stdio.h>
#include <string.h>

int main()
{
    extern int ft_strcmp(char *s1, char *s2);

    {
        int diff = ft_strcmp("A", "a");
        printf("ft_strlen A - a is :%d\n", diff);
        
        int diff2 = strcmp("A", "a");
        printf("strlen A - a is :%d\n", diff2);
    }

    {
        int diff = ft_strcmp("a", "A");
        printf("ft_strlen a - A is :%d\n", diff);
        
        int diff2 = strcmp("a", "A");
        printf("strlen a - A is :%d\n", diff2);
    }

    {
        int diff = ft_strcmp("a", "a");
        printf("ft_strlen a - a is :%d\n", diff);
        
        int diff2 = strcmp("a", "a");
        printf("strlen a - a is :%d\n", diff2);
    }

    {
        int diff = ft_strcmp("a", "aA");
        printf("ft_strlen a - aA is :%d\n", diff);
        
        int diff2 = strcmp("a", "aA");
        printf("strlen a - aA is :%d\n", diff2);
    }

    {
        int diff = ft_strcmp("aA", "a");
        printf("ft_strlen aA - a is :%d\n", diff);
        
        int diff2 = strcmp("aA", "a");
        printf("strlen aA - a is :%d\n", diff2);
    }

    {
        int diff = ft_strcmp("", "a");
        printf("ft_strlen '' - a is :%d\n", diff);
        
        int diff2 = strcmp("", "a");
        printf("strlen '' - a is :%d\n", diff2);
    }

    {
        int diff = ft_strcmp("a", "");
        printf("ft_strlen a - '' is :%d\n", diff);
        
        int diff2 = strcmp("a", "");
        printf("strlen a - '' is :%d\n", diff2);
    }
    return 0;
}