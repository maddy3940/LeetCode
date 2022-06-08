# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
                
        visited=[]

        while True:
            
            try:     
                if head in visited:
                    return True
                visited.append(head)
                head=head.next
        
            except:
                return False