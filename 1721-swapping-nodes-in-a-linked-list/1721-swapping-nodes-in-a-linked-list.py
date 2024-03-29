# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapNodes(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        
	    # Initial State
        slow, fast = head, head
		
		# Phase 1
        for _ in range(k - 1):
            fast = fast.next
        first = fast

        # Phase 2
        while fast.next:
            slow, fast = slow.next, fast.next
		
		# Last
        first.val, slow.val = slow.val, first.val

        return head
        

            
            
            
            