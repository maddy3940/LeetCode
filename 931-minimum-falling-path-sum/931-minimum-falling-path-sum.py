class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        
        
        # Bottom Up
        
        
        dp=matrix[len(matrix)-1]
        print(dp)
        for i in range(len(matrix)-2,-1,-1):
            
            curr_row=[math.inf for i in range(len(matrix))]
            
            for j in range(len(matrix)):
                
                if j==0:
                    curr_row[j]=min(dp[j],dp[j+1]) + matrix[i][j]
                    
                elif j==len(matrix)-1:
                    curr_row[j]=min(dp[j-1],dp[j]) + matrix[i][j]
                
                else:
                    curr_row[j]=min(dp[j-1],dp[j],dp[j+1]) + matrix[i][j]
        
            dp=curr_row
            
        return min(dp)
#         # Top down
        
#         memo=[[math.inf for i in range(len(matrix))] for j in range(len(matrix))]
        
#         min_sum=math.inf
        
#         for i in range(len(matrix)):
                
#             min_sum=min(self.findminpath(matrix,memo,0,i),min_sum) 
                
                
#         return min_sum
    
    
#     def findminpath(self,matrix,memo,row,col):
        
#         if col<0 or col==len(matrix):
#             return math.inf
        
#         elif row==len(matrix)-1:
#             return matrix[row][col]
        
#         elif memo[row][col]!=math.inf:
#             return memo[row][col]
        
#         memo[row][col]=  matrix[row][col] + min(self.findminpath(matrix,memo,row+1,col),self.findminpath(matrix,memo,row+1,col+1),self.findminpath(matrix,memo,row+1,col-1))
        
#         return memo[row][col]
        