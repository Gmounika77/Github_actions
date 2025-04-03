public with sharing class TestApex {
    public void testMethod() {
        List<Account> accounts = [SELECT Id, Name, Company FROM Account]; // Potential SOQL issue
        for (Account acc : accounts) {
            System.debug('Account Name: ' + acc.Name) // Missing semicolon
        }
    }
}
