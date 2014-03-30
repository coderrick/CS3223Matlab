%function res = palindrome
function res = isPalindrome(string)
    res = all(string == fliplr(string)); %See if flipping the string produces the original string
    if not(res) %If not a palindrome
        string = lower(string); %Lower case everything
        res = all(string == fliplr(string)); %Test again
    end
    if not(res) %If still not a palindrome
        string(isspace(string)) = []; %Strip all space characters out
        res = all(string == fliplr(string)); %Test one last time
    end
end