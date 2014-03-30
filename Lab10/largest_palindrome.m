%Input: A string that may or may not be a palindrome
%Output: An integer representing the length of the largest palindrome
function res = largest_palindrome( string )
    len = size(string, 2);
    largest = 0;
    for n = 1:len
        for m = n:len
            check_str = string(n:m);
            palindrome = is_palindrome(check_str);
            if largest < palindrome
                largest = palindrome;
            end
        end
    end
    res = largest;
end

function res = is_palindrome(string)
    len = size(string, 2);
    palindrome = 1;
    res = 0;
    
    for i = 1:ceil(len/2)
        if (string(i) ~= string(len+1-i))
            palindrome = 0;
            break;
        end
    end
    if palindrome == 1
        res = len;
    end
end

