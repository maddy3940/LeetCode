# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        
        if list1 is None:
            return list2
        elif list2 is None:
            return list1
        if list1.val<list2.val:
            merged=ListNode(val=list1.val)
            list1=list1.next
        else:
            merged=ListNode(val=list2.val)
            list2=list2.next
        
        head=merged
        while list1 is not None and list2 is not None:
            
            if list1.val<list2.val:
                t_node=ListNode(list1.val)
                merged.next=t_node
                merged=merged.next
                list1=list1.next
                
            else:
                t_node=ListNode(list2.val)
                merged.next=t_node
                merged=merged.next
                list2=list2.next
                
        if list1 is None:
            while list2:
                t_node=ListNode(list2.val)
                merged.next=t_node
                list2=list2.next
                merged=merged.next
        else:
            while list1:
                t_node=ListNode(list1.val)
                merged.next=t_node
                list1=list1.next
                merged=merged.next

        
        return head
        
        
        
        
        
        
        
        