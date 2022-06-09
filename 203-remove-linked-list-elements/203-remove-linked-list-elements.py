# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        
        
        
        # if head.next=None:
        #     if head.val=val:
        #         return
        #     else:
        #         return head
            
        if head:
            prev=ListNode()
            prev.next=head
            copy=prev
        else:
            return
        
        while head!=None:

            if head.val==val:
                prev.next=head.next
                head=head.next
            else:
                prev=head
                head=head.next

        return copy.next

            
            
