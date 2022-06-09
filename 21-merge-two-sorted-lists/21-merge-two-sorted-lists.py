# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        
        
        list3=ListNode()
        copy=list3
        while list1!=None and list2!=None:
            x=ListNode()
            if list1.val<=list2.val:
                x.val=list1.val
                list3.next=x
                list1=list1.next

            else:
                x.val=list2.val
                list3.next=x
                list2=list2.next
            list3=list3.next

        if list1==None:
            while list2!=None:
                x=ListNode(list2.val)
                list3.next=x
                list2=list2.next
                list3=list3.next
            
            
        if list2==None:
            while list1!=None:
                x=ListNode(list1.val)
                list3.next=x
                list1=list1.next
                list3=list3.next
                
        return copy.next