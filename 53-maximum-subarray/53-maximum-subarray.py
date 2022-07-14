class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        
        
        
        a=[nums[0]]
        for i in range(1,len(nums)):
            x=a[i-1]+nums[i]
            if x>nums[i]:
                a.append(x)
            else:
                a.append(nums[i])
                
        return max(a)
        