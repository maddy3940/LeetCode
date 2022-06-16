class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        
        
        
        dp=triangle[-1]
        
        
        
        for i in range(len(triangle)-2,-1,-1):
            
            curr=[math.inf for i in range(len(triangle[i]))]
            for j in range(len(triangle[i])):
                
                curr[j]=triangle[i][j] + min(dp[j],dp[j+1])
                
            dp=curr
            
        return(dp[0])
            
            