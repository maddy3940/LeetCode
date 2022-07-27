# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        
        
        prehead=ListNode(-1)
        prev=prehead
        
        while head is not None:

            if head.val==val:
                while head is not None and head.val==val:
                    head=head.next
            
            prev.next=head
            prev=prev.next
            if head is not None:
                head=head.next
                
        return prehead.next
            
            
            
            
            
            
        
        
        