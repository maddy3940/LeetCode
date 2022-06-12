class Solution:
    def intersection(self, nums: List[List[int]]) -> List[int]:
        
        
        res=Counter(nums[0])
        for i in range(len(nums)):
            res=Counter(nums[i]) & res
            
            
        return (sorted([i for i in res.keys()]))