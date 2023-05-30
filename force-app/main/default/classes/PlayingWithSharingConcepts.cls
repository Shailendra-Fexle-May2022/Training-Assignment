/**
*
*  Purpose          :   Class to have with/without sharing based concept demonstration.
*
*  Created Date     :   10/06/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public with sharing class PlayingWithSharingConcepts 
{
    private School__c school;
    
    public Integer noOfSchools {get; set;}
    public List<School__c> listOfSchools {get; set;}
    
    public PlayWithInnerClass playInnerClass {get; set;}
    
    //Query Schools button on School record
    public PlayingWithSharingConcepts(ApexPages.StandardController stdController) 
    {
        listOfSchools = new List<School__c>();
        this.school = (School__c)stdController.getRecord();
        
        List<School__c> schools = [SELECT ID, Name, Location__c 
                   FROM School__c];
        
        playInnerClass = new PlayWithInnerClass();
        
        if(schools.size() > 0) 
        {
        	noOfSchools = schools.size();
        	listOfSchools = schools;    
        }
        else 
        {
            noOfSchools = 0;
            listOfSchools = new List<School__c>();
        }
    }
    
    public PlayingWithSharingConcepts() 
    {
        listOfSchools = new List<School__c>();
    	List<School__c> schools = [SELECT ID, Name, Location__c 
                   FROM School__c];
        
        if(schools.size() > 0) 
        {
        	noOfSchools = schools.size();
        	listOfSchools = schools;    
        }
        else 
        {
        	noOfSchools = 0;
            listOfSchools = new List<School__c>();    
        }
    }
    
    //Inner Class
    public inherited sharing class PlayWithInnerClass 
    {
        public Integer noOfSchls {get; set;}
    	public List<School__c> listOfSchls {get; set;}
        
        public PlayWithInnerClass() 
        {
            List<School__c> schools = [SELECT ID, Name, Location__c FROM School__c];
            
            if(schools.size() > 0) 
            {
            	noOfSchls = schools.size();
                listOfSchls = schools;
            }
            else 
            {
                noOfSchls = 0;
                listOfSchls = new List<School__c>();
            }
        }
    }
}