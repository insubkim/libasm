#include <stdio.h>

int main()
{
    extern int _return_num(void);

    int ret = _return_num();

    printf("ret :%d\n", ret);

    return 0;
}