/**
*
*  Purpose          :   Class to demonstrate the static ways to deal with or populate collections in apex.
*
*  Created Date     :   09/03/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class StaticWaysToDealsWithCollections {

    // Map of School with classes and its corresponding students
    public static Map<String,Map<String,List<String>>> mapOfSchoolNameWithClassNameAndRelatedStudentsDetails = new Map<String,Map<String,List<String>>>();

    //Construction
    public StaticWaysToDealsWithCollections() {
       
        //List of District of Indian States
        List<String> listOfRajasthanDistrict = new List<String>{'Jaipur','Ajmer','Kota'};
        List<String> listOfBiharDistrict = new List<String>{'Buxar','Gaya','Patna'};

        //Map of States with districts of India
        Map<String, List<String>> mapOfIndianStatesWithDistricts = new Map<String, List<String>>{'Rajasthan'=>listOfRajasthanDistrict,'Bihar'=>listOfBiharDistrict};

        //List of District of US States
        List<String> listOfNewYorkDistrict = new List<String>{'Lockport','Kingston','Geneva'};
        List<String> listOfNewJerseyDistrict = new List<String>{'Paterson','Newark','Brick'};

        //Map of States with districts of US
        Map<String, List<String>> mapOfUsStatesWithDistricts = new Map<String, List<String>>{'NewYork'=>listOfNewYorkDistrict,'NewJersey'=>listOfNewJerseyDistrict};

        //Map of US with states and districts
        mapOfSchoolNameWithClassNameAndRelatedStudentsDetails = new Map<String,Map<String,List<String>>>{'India'=> mapOfIndianStatesWithDistricts,'US'=> mapOfUsStatesWithDistricts};
        System.debug(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails);
    }
}