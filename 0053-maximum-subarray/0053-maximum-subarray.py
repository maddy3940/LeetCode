class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        
        
        
        s=m=-99999
        for i in range(len(nums)):
            
            if nums[i]>s+nums[i] and nums[i]>s:
                s=nums[i]
            else:
                s+=nums[i]
                
            if s>m:
                m=s
                
        return m
        
        
        