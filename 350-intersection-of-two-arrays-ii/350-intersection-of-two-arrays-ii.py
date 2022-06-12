class Solution:
    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:
        res1={}
        res=[]
        
        for i in nums1:
            res1[i]=res1.get(i,0)+1
            
        for j in nums2:
            if res1.get(j,0)!=0:
                res.append(j)
                res1[j]=res1[j]-1
            
        return res
                
        