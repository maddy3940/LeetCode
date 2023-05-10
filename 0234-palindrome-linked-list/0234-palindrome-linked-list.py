# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        stack = []
        slow = fast = head

        # Push the values of the first half of the linked list onto the stack
        while fast and fast.next:
            stack.append(slow.val)
            slow = slow.next
            fast = fast.next.next

        # Skip the middle node if the length is odd
        if fast:
            slow = slow.next

        # Compare the remaining half of the linked list with the values popped from the stack
        while slow:
            if slow.val != stack.pop():
                return False
            slow = slow.next

        return True
            
            
            
        
        
        
        
        
        