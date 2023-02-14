class Solution:
    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        n=len(nums)
        nums=set(nums)
        res=[]
        for i in range(n):
            if i+1 not in nums:
                res.append(i+1)
        return res
            