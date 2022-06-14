class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        
        
        # Top down
        
        memo=[[math.inf for i in range(len(matrix))] for j in range(len(matrix))]
        
        min_sum=math.inf
        
        for i in range(len(matrix)):
                
            min_sum=min(self.findminpath(matrix,memo,0,i),min_sum) 
                
                
        return min_sum
    
    
    def findminpath(self,matrix,memo,row,col):
        
        if col<0 or col==len(matrix):
            return math.inf
        
        elif row==len(matrix)-1:
            return matrix[row][col]
        
        elif memo[row][col]!=math.inf:
            return memo[row][col]
        
        memo[row][col]=  matrix[row][col] + min(self.findminpath(matrix,memo,row+1,col),self.findminpath(matrix,memo,row+1,col+1),self.findminpath(matrix,memo,row+1,col-1))
        
        return memo[row][col]
        