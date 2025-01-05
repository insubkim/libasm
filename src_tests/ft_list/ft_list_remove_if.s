section .text
global _ft_remove_list_if
_ft_remove_list_if:
	;rdi for head, rsi for data_ref, rdx for cmp, rcx for free
	;check null
	;loop
	;cmp data
	;if same, unlink node and free
