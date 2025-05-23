#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct s_list
{
    void    *data;
    struct  s_list  *next;
} t_list;

void    iter(t_list *head)
{
    while (head)
    {
        printf("data :%s\n", (char*)head->data);
        head = head -> next;
    }
}

// void ft_list_sort(t_list** head, int (*cmp)())
// {
// 	if (!head || !*head || !cmp)
// 		return ;
// 	t_list	*start = *head;
// 	t_list	*n = *head;
// 	t_list	*n_prev = 0;
// 	while (n)
// 	{
// 		t_list	*p = n -> next;
// 		t_list	*p_prev = n;
// 		while (p)
// 		{
// 			if (cmp(n -> data, p -> data < 0) > 0)
// 			{
// 				// change n, p
// 				// 1. a -> n -> b -> p 
// 				if (n_prev != 0 && p_prev != n)
// 				{
// 					t_list *n_next = n -> next;
// 					n -> next = p -> next;
// 					p -> next = n_next;
// 					n_prev -> next = p;
// 					p_prev -> next = n;
// 				}
// 				// 2. a -> n -> p
// 				if (n_prev != 0 && p_prev == n)
// 				{
// 					n -> next = p -> next;
// 					p -> next = n;
// 					n_prev -> next = p;
// 				}
// 				// 3. 0 -> n -> b -> p
// 				if (n_prev == 0 && p_prev != n)
// 				{
// 					t_list *n_next = n -> next;
// 					n -> next = p -> next;
// 					p -> next = n_next;
// 					p_prev -> next = n;
// 					start = p;
// 				}	
// 				// 4. 0 -> n -> p
// 				if (n_prev == 0 && p_prev == n)
// 				{
// 					n -> next = p -> next;
// 					p -> next = n;
// 					start = p;
// 				}
// 				t_list *tmp = n;
// 				n = p;
// 				p = tmp;

// 				tmp = n_prev;
// 				n_prev = p_prev;
// 				p_prev = tmp;
// 			}
// 			p_prev = p;
// 			p = p -> next;
// 		}
// 		n_prev = n;
// 		n = n -> next;
// 	}
// 	*head = start;
// }

int main(void)
{
    t_list  list = {"4", NULL};
    t_list* head = &list;

    extern void _ft_list_push_front(t_list **begin_list, void *data);

    _ft_list_push_front(&head, "2");
    _ft_list_push_front(&head, "1");
    _ft_list_push_front(&head, "3");

    extern int _ft_list_size(t_list *head);

    int list_size = _ft_list_size(head); 
    printf("list size :%d\n", list_size);

    extern void _ft_list_sort(t_list **begin_list, int (*cmp)());
    
    printf("Before Sort\n");
    iter(head);

    _ft_list_sort(&head, strcmp);
    
    printf("After Sort\n");
    iter(head);

    
//     _ft_list_push_front(&head, "7");
//     _ft_list_push_front(&head, "6");
//     _ft_list_push_front(&head, "5");
//     _ft_list_push_front(&head, "4");
//     _ft_list_push_front(&head, "3");
//     _ft_list_push_front(&head, "8");
//     _ft_list_push_front(&head, "2");
//     _ft_list_push_front(&head, "a");
//     _ft_list_push_front(&head, "z");
//     _ft_list_push_front(&head, "d");
//     _ft_list_push_front(&head, "e");
//     _ft_list_push_front(&head, "r");
//     _ft_list_push_front(&head, "10");

//     printf("Before Sort\n");
//     iter(head);

//     _ft_list_sort(&head, strcmp);
// //     ft_list_sort(&head, strcmp);
    
//     printf("After Sort\n");
//     iter(head);

    extern void _ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

    char *data_ref = "freeable";
    char *data = malloc(sizeof(char) * (strlen(data_ref) + 1));
    memcpy(data, data_ref, strlen(data_ref));

    _ft_list_push_front(&head, data);

    printf("before remove\n");
    iter(head);

    _ft_list_remove_if(&head, data_ref, strcmp, free);

    printf("after remove\n");
    iter(head);

    return 0;
}
