public with sharing class TestApex {
    public void testMethod() {
        List<Account> accounts = [SELECT Id, Name, CompanyFROM Account]; // Potential SOQL issue
        for (Account acc : accounts) {
            System.debug('Account Name: ' + acc.Name) // Missing semicolon
        }
    }
}
