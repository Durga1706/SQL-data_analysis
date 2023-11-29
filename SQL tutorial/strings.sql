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

--5. CONCAT_WS: concate with separator
SELECT CONCAT_WS(', ', '1 Microsoft Way','Redmond', 'WA', 98052) Address, CONCAT_WS(':',')',')') mood;
Address	                                mood
1 Microsoft Way, Redmond, WA, 98052  	  ):)

--6. DIFFERENCE: compares two strings using Soundex and returns a similarity scale from 0 to 4
SELECT DIFFERENCE('Juice', 'Jucy') strong_sim, DIFFERENCE('Juice', 'Banana') med_simi, DIFFERENCE('Apple','pink') weak_sim;
strong_sim	med_simi	weak_sim
    4	        2	        1

-- 7. SOUNDEX: converts the string to a four-character code based on how the string sounds when spoken
SELECT SOUNDEX('Juice') s1, SOUNDEX('Jucy') s2, DIFFERENCE('Juice', 'Jucy') d1, SOUNDEX('Juice') s3, SOUNDEX('Banana') s4,DIFFERENCE('Juice', 'Banana') d2;
s1	     s2	    d1	 s3	    s4	   d2
J200	J200	4	J200	B550	2

--8. FORMAT
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy', 'en-US' ) 'US_Date', FORMAT(GETDATE(), 'dd/MM/yyyy', 'de-de' ) 'Germa_Date', FORMAT(SYSDATETIME(), N'hh:mm tt') 'time',
       FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm tt') 'am_time', FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') '24_time',
       FORMAT(123456789,'###-##-####') 'Custom Number', FORMAT(1.4683, 'N', 'en-us')'Numeric Format', FORMAT(1.4683, 'G', 'en-us') 'General Format',
       FORMAT(1.4683, 'C', 'en-us') 'Currency Format';
US_Date	    Germa_Date	 time	     am_time	24_time	 Custom Number	  Numeric Format	General Format	Currency Format
29/11/2023	29.11.2023	06:50 AM	01:00 AM	14:00	123-45-6789	          1.47	           1.4683	         $1.47

--9. LEN, LEFT and RIGHT
SELECT LEN('abcdefg') str_len, LEFT('abcdefg',2) left_2_str,RIGHT('abcdefg',2) right_2_str;
str_len left_2_str	right_2_str
 7         ab	       fg

--10. LOWER and UPPER
SELECT LOWER('abcdefg') str_lower, UPPER('abcdefg') str_upper;
str_lower	str_upper
abcdefg	    ABCDEFG

--11. LTRIM and RTRIM
SELECT LTRIM(' Durga ') 'l_trim', RTRIM(' Durga ') 'r_trim', LTRIM('123abc.' , '123.') 'remove_char';        
l_trim	r_trim  remove_char
Durga	Durga    abc.

--12. PATINDEX: Returns the starting position of the first occurrence of a pattern
SELECT position = PATINDEX('%ter%', 'interesting data'), wildcard_pattern= PATINDEX('%en_ure%', 'Please ensure the door is locked!'), no_alphanumeric_position = PATINDEX('%[^ 0-9A-Za-z]%', 'Please ensure the door is locked!'), 
specified_var_pattern= PATINDEX('%' + 'ensure' + '%', 'Please ensure the door is locked!');
position	wildcard_pattern	no_alphanumeric_position	specified_var_pattern
3	            8	                    33	                            8

--13. REPLACE
SELECT REPLACE('abcdefghicde','cde','xxx') x_replace, REPLACE('ABC ABC ABC', 'a', 'c') c_replace,REPLACE('ABc ABc ABC', 'c', 'd') d_replace, space_count=len('This is a sentence with spaces in it.')-len(replace('This is a sentence with spaces in it.',' ',''));  
x_replace	    c_replace	 d_replace	  space_count
abxxxfghixxx	cBC cBC cBC	 ABd ABd ABd	  7

--14. DATALENGTH: 
select 'Sharma' orginal_str, DATALENGTH('Sharma') str_len;
orginal_str	 str_len
Sharma         6

--15. REPLICATE: Repeats a string value a specified number of times
SELECT REPLICATE('abc ',2) two_times, REPLICATE('1',8- DATALENGTH(' abc ')) len_times,REPLICATE('1',8- DATALENGTH(' abc ')) + 5 'len_replicate1', REPLICATE('1',8- DATALENGTH(' abc ')) + 9 'len_replicate2';  
two_times	len_times	len_replicate1	len_replicate2
abc abc	     111	         116	        120

--16. REVERSE
SELECT 'Durga' name, REVERSE('Durga') reverse_name;
name	reverse_name
Durga	agruD

--17. SPACE
