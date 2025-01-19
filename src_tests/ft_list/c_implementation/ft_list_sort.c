void ft_list_sort(t_list** head, void (*cmp)())
{
	if (!head || !*head || !cmp)
		return ;
	t_list	*start = *head;
	t_list	*n = *head;
	t_list	*n_prev = 0;
	while (n)
	{
		t_list	*p = n -> next;
		t_list	*p_prev = n;
		while (p)
		{
			if (cmp(n -> data, p -> data < 0) > 0)
			{
				// change n, p
				// 1. a -> n -> b -> p 
				if (n_prev != 0 && p_prev != n)
				{
					t_list *n_next = n -> next;
					n -> next = p -> next;
					p -> next = n_next;
					n_prev -> next = p;
					p_prev -> next = n;
				}
				// 2. a -> n -> p
				if (n_prev != 0 && p_prev == n)
				{
					n -> next = p -> next;
					p -> next = n;
					n_prev -> next = p;
				}
				// 3. 0 -> n -> b -> p
				if (n_prev == 0 && p_prev != n)
				{
					t_list *n_next = n -> next;
					n -> next = p -> next;
					p -> next = n_next;
					p_prev -> next = n;
					start = p;
				}	
				// 4. 0 -> n -> p
				if (n_prev == 0 && p_prev == n)
				{
					n -> next = p -> next;
					p -> next = n;
					start = p;
				}
				t_list *tmp = n;
				n = p;
				p = tmp;

				tmp = n_prev;
				n_prev = p_prev;
				p_prev = tmp;
			}
			p_prev = p;
			p = p -> next;
		}
		n_prev = n;
		n = n -> next;
	}
	*head = start;
}
