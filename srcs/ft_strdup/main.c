#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
  const char *s = "Hello World!";

  char *ft_dup = 0;
  char *dup = 0;

  extern char* ft_strdup(const char *s);

  {
    ft_dup = ft_strdup(s);
    printf("ft_strdup :%s\n", ft_dup);
    free(ft_dup);
  
    dup = strdup(s);
    printf("strdup :%s\n", dup);
    free(dup);
  }


  return 0;
}