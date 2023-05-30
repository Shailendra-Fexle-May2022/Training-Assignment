/**
*
*  Purpose          :   SOQL Query Wrapper Class.
*
*  Created Date     :   09/12/2022
*
*  Created By       :   Shaielndra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class SOQLQueryWrapper 
{
    public String sOQLQuery {get; set;}
    public List<GenericTableHeaderWrapper> listOfGenericTableHeaderWrapper {get; set;}
    
    public SOQLQueryWrapper() 
    {
        sOQLQuery = Constants.CHAR_BLANK;
        listOfGenericTableHeaderWrapper = new List<GenericTableHeaderWrapper>(); 
    }
}