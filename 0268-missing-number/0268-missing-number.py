class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        
        nums=sorted(nums)
        for i,val in enumerate(nums):
            if i!=val:
                return i
        
        return len(nums)