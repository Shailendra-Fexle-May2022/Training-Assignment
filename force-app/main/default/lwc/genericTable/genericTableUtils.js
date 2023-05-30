/*
Purpose         :   Utilities JS specific to generic table
Created By      :   Shailendra Sharma
Created Date    :   14/12/2022
Current Version :   v1.0
Revision Log    :   V_1.0 Created - Abhinav Sharma - 14/12/2022
*/
//Exporting a function
const listOfSplitedStrings = function(stringliteral)
{
    if(!Object.is(stringliteral, null) && !Object.is(stringliteral, '')) 
    {
        return stringliteral.split(',');
    }
}

export {listOfSplitedStrings};