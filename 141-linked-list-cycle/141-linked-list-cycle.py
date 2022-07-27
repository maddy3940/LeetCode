# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        
        x1=head
        x2=head
        
        if head==None:
            return False
        
        while True:
            if x2 is None or x2.next is None:
                return False
            elif x2.next==x1:
                    return True
            else:
                x1=x1.next
                x2=x2.next.next
        