/**
*
*  Purpose          :   Class to demonstrate the different method of Map in apex.
*
*  Created Date     :   09/02/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class MapCollectionPractice {

    public MapCollectionPractice() {

        Boolean keyCheck;
        Boolean equaliityCheck;
        String getValue;

       // Map<Integer, String> intToStrMap = new Map<Integer, String>{1=>'US',2=>'USA',3=>'India'};
        Map<Integer, String> mapOfIntegerKeyAndStringValue = new Map<Integer, String>();

        mapOfIntegerKeyAndStringValue.put(1,'US');
        mapOfIntegerKeyAndStringValue.put(2,'USA');
        mapOfIntegerKeyAndStringValue.put(3,'India');
        System.debug('Map elements =>'+ mapOfIntegerKeyAndStringValue);//{1=US, 2=USA, 3=India}
        
        mapOfIntegerKeyAndStringValue.remove(2);
        System.debug('Map element after remove some element=>'+ mapOfIntegerKeyAndStringValue);//Map element after remove some element=>{1=US, 3=India}
        
        Map<Integer, String> mapOfIntegerKeyAndStringValue1 = new Map<Integer, String>{4=>'Ukrine',5=>'China',6=>'Pakiasthan'};
        mapOfIntegerKeyAndStringValue.putAll(mapOfIntegerKeyAndStringValue1);
        System.debug('Map element after putting another Map element=>'+ mapOfIntegerKeyAndStringValue);//Map element after putting another Map element=>{1=US, 3=India, 4=Ukrine, 5=China, 6=Pakiasthan}
        
        System.debug('Map size=>'+ mapOfIntegerKeyAndStringValue.size());//5    

        equaliityCheck = mapOfIntegerKeyAndStringValue.equals(mapOfIntegerKeyAndStringValue1);
        System.debug('EqualiityCheck of Map =>'+ equaliityCheck); //false
        
        List<String> stringList = new List<String>();
        stringList = mapOfIntegerKeyAndStringValue.values();
        System.debug('Map values=>'+ stringList);//Map values=>(US, India, Ukrine, China, Pakiasthan)
        
        Set<Integer> setOfKeys = new Set<Integer>();
        setOfKeys = mapOfIntegerKeyAndStringValue.keySet();
        System.debug('Map ketSet=>'+ setOfKeys);//Map ketSet=>{1, 3, 4, 5, 6}
        
        keyCheck = mapOfIntegerKeyAndStringValue.containsKey(2);
        System.debug('Map containsKey=>'+ keyCheck);//false
        
        getValue =  mapOfIntegerKeyAndStringValue.get(3);
        System.debug('Get the value of map at given key=>'+ getValue);//Get the value of map at given key=>India
        
        Map<Id, Account> accMap = new Map<Id, Account>([Select Id, Name From Account Limit 2]);
        System.debug('accMap=>'+ accMap);
        //accMap=>{0015g00000ooNLnAAM=Account:{Id=0015g00000ooNLnAAM, Name=Sample Account for Entitlements}, 
        //0015g00000oocxQAAQ=Account:{Id=0015g00000oocxQAAQ, Name=Ashok Kumar}}
        System.debug('accMap=>'+ accMap.isEmpty());//false

    }
}