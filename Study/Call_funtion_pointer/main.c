#include <stdio.h>

void print_hello(void)
{
    printf("hello\n");
}

// Declaration of the assembly function
extern void _call_c(void (*f)(void));

int main(void)
{
    _call_c(print_hello);
    return 0;
}
