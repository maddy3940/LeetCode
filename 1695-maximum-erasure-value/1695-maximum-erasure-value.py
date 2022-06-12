class Solution:
    def maximumUniqueSubarray(self, nums: List[int]) -> int:
        
        
        
        
        max_sum=0
        curr_sum=0
        start=0
        s=set()

        for i in range(len(nums)):       
            if nums[i] not in s:
                curr_sum+=nums[i]
                s.add(nums[i])
                #print(s)
                
            else:
                max_sum=max(curr_sum,max_sum)
                while nums[start]!=nums[i]:
                    curr_sum-=nums[start]
                    s.discard(nums[start])
                    start+=1
                start+=1
                
                    
        max_sum=max(curr_sum,max_sum)
            

        return max_sum
                    
                
                
                