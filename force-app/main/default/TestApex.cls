public class Batch_DeleteReminderEmails implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([
            SELECT Id, Subject 
            FROM Task 
            WHERE (Subject LIKE '%(Reminder) Webinar: Sync Fast%' OR 
                   Subject LIKE '%Webinar: Sync Fast%') 
              AND IsDeleted = FALSE
        ]);
    }

    public void execute(Database.BatchableContext BC, List<Task> scope) {
        try {
            if (scope.size() > 0) {
                delete scope;
                System.debug('Batch of tasks deleted: ' + scope.size());
            }
        } catch (Exception e) {
            // Log the error and continue processing
            System.debug('Error during batch execution: ' + e.getMessage());
        }
    }

    public void finish(Database.BatchableContext BC) {
        try {
            System.debug('Batch job completed.');
        } catch (Exception e) {
            // Log any error during the finish phase
            System.debug('Error during batch job finish: ' + e.getMessage());
        }
    }
}
