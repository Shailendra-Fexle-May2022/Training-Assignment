public without sharing class ContactCreation {
    public static void createContactUnderAccountBasedOnFiledValue(Account acc){
        
        List<Contact> newContactList = new List<Contact>();
        List<String> listOfString = acc.Contact_Details__c.split('/n');
        System.debug(listOfString);
        for(String st : listOfString){
            String fname = st.substringBefore(',');
            System.debug(fname);
            String firstName = fname.substringAfter('=');
            System.debug(firstName);
            String remainingString = st.substringAfter(',');
            String lname = remainingString.substringBefore(',');
            String lastName = lname.substringAfter('=');
            System.debug(lastName);
            String ename = remainingString.substringAfter(',');
            System.debug(ename);
            String email = ename.substringAfter('=');
            System.debug(email);
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.FirstName = firstName;
            con.LastName = lastName;
            con.Email = email;
            newContactList.add(con);
            System.debug(newContactList);
        }
        if(!newContactList.isEmpty())
            insert newContactList;
        
    }
}