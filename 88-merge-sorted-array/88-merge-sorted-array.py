class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        
        l1,l2,l=m-1,n-1,len(nums1)-1
        
        if m==0:
            l1=len(nums1)-1
            while l1>=0:
                nums1[l1]=nums2[l2]
                l1-=1
                l2-=1
        
        while l>=0 and l1>=0 and l2>=0:
            
            if nums1[l1]<nums2[l2]:
                nums1[l]=nums2[l2]
                l2-=1
                l-=1
            
            else:
                nums1[l]=nums1[l1]
                l1-=1
                l-=1
        
        while l1>=0 or l2>=0:
            if l1>=0:
                nums1[l]=nums1[l1]
                l1-=1
            else:
                nums1[l]=nums2[l2]
                l2-=1
            l-=1
                
            