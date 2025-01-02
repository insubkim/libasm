#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{

  char *ft_dup = 0;
  char *dup = 0;

  extern char* _ft_strdup(const char *s);

  {
    const char *s = "Hello World!";
    
    ft_dup = _ft_strdup(s);
    printf("_ft_strdup :%s\n", ft_dup);
    free(ft_dup);
  
    dup = strdup(s);
    printf("strdup :%s\n", dup);
    free(dup);
  }

{
    char s[1024 * 1024] = {0, };
    for (int i = 0; i < 1024 * 1024 - 1; i++)
      s[i] = '*';
    
    ft_dup = _ft_strdup(s);
    printf("_ft_strdup :%s\n", ft_dup);
  
    dup = strdup(s);
    printf("strdup :%s\n", dup);
    
    printf("is same = %d\n", strcmp(ft_dup, dup));

    free(ft_dup);
    free(dup);
  }
  return 0;
}
