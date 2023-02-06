class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        
        
        a = nums[:n]
        b = nums[n:]
        
        x=y=0
        for i in range(2*n):
            if i%2==0:
                nums[i]=a[x]
                x+=1
            else:
                nums[i]=b[y]
                y+=1
        return(nums)