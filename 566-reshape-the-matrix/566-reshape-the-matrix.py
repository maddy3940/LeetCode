class Solution:
    def matrixReshape(self, mat: List[List[int]], r: int, c: int) -> List[List[int]]:
        
        
        if len(mat)*len(mat[0])!=r*c:
            return mat
        
        else:
            res=[[0 for i in range(c)]for j in range(r)] 

            lst=[item for sublist in mat for item in sublist ]

            lst=lst[::-1]
            for i in range(r):
                for j in range(c):
                    res[i][j]=lst.pop()


            return(res)