class Solution:
    def maxSubArray(self, nums: List[int]) -> int:

        if not nums:
            return
        max_sum = curr_sum = -math.inf
        start = end = 0 # init vars
        
        for i, n in enumerate(nums):
            if curr_sum + n < n: 
                curr_sum = n # don't need previous subarr sum
                curr_start = curr_end = i # reset indices 
            else:
                curr_sum += n # need previous subarr
                curr_end = i # update right index
            if curr_sum > max_sum: # found a subarr with greater sum
                max_sum = curr_sum
                start, end = curr_start, curr_end # assign indices for later use
    
        return sum(nums[start:end+1]) # max sum using start/end index