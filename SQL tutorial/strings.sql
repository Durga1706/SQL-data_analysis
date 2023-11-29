-- 1. ASCII
SELECT ASCII('A') AS A, ASCII('B') AS B, ASCII('a') AS a, ASCII('b') AS b, ASCII(1) AS [1], ASCII(2) AS [2];
A           B           a           b           1           2  
65          66          97          98          49          50

-- 2. CHAR: returns the character based on the ASCII code
SELECT CHAR(65) AS [65], CHAR(66) AS [66], CHAR(97) AS [97], CHAR(98) AS [98], CHAR(49) AS [49], CHAR(50) AS [50];
65   66   97   98   49   50  
A    B    a    b    1    2

--3. CHARINDEX: searches for a substring in a string, and returns the position
SELECT CHARINDEX('is', 'This is a string') match_type, CHARINDEX('is', 'This is a string', 4) specific_pos, CHARINDEX('at', 'This is a string') not_found_str, CHARINDEX ( 'TEST','This is a Test'  
COLLATE Latin1_General_CI_AS) case_inse;
match_type	specific_pos	not_found_str	case_inse
    3	          6	            0	            11

--4. CONCAT
SELECT 'Happy' + ' Birthday' wish, CONCAT('Happy', 'Birthday') Res1, CONCAT('Happy ', 'Birthday') Res2;
wish               Res1	              Res2
Happy Birthday   HappyBirthday	    Happy Birthday   

--5. CONCAT_WS - concate with separator
SELECT CONCAT_WS(', ', '1 Microsoft Way','Redmond', 'WA', 98052) Address, CONCAT_WS(':',')',')') mood;
Address	                                mood
1 Microsoft Way, Redmond, WA, 98052  	  ):)
