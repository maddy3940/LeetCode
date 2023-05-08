<h2><a href="https://leetcode.com/problems/count-artist-occurrences-on-spotify-ranking-list/">2669. Count Artist Occurrences On Spotify Ranking List</a></h2><h3>Easy</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <code><font face="monospace">Spotify</font></code></p>

<pre>+-------------+---------+ 
| Column Name | Type    | 
+-------------+---------+ 
| id          | int     | 
| track_name  | varchar |
| artist      | varchar |
+-------------+---------+
<code>id</code> is the primary Key for this table.
Each row contains an id, track_name, and artist.
</pre>

<p>Write an SQL query to find how many times each artist appeared on the spotify ranking list.</p>

<p>Return <em>the result table having the artist's name along with the corresponding number of occurrences&nbsp;ordered by occurrence count in&nbsp;<strong>descending </strong>order. If the occurrences are equal, then it’s ordered by the artist’s name in <strong>ascending</strong> order.</em></p>

<p>The query result format is in the following example​​​​​​.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre><strong>Input:
</strong>Spotify table: 
+---------+--------------------+------------+ 
| id      | track_name         | artist     |  
+---------+--------------------+------------+
| 303651  | Heart Won't Forget | Sia        |
| 1046089 | Shape of you       | Ed Sheeran |
| 33445   | I'm the one        | DJ Khalid  |
| 811266  | Young Dumb &amp; Broke | DJ Khalid  | 
| 505727  | Happier            | Ed Sheeran |
+---------+--------------------+------------+ 
<strong>Output:
</strong>+------------+-------------+
| artist     | occurrences | 
+------------+-------------+
| DJ Khalid  | 2           |
| Ed Sheeran | 2           |
| Sia        | 1           | 
+------------+-------------+ 

<strong>Explanation: </strong>The count of occurrences is listed in descending order under the column name "occurrences". If the number of occurrences is the same, the artist's names are sorted in ascending order.
</pre>
</div>