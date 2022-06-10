# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        
        if head and head.next!=None:
            prev = head
            next = head.next
            head.next = None
            head = next
        
            while head.next!=None:

                next=head.next
                head.next = prev
                prev=head
                head=next
            head.next = prev
            return head

                
                
        else:
            return head