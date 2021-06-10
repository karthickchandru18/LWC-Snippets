trigger leadTrigger on Lead (after insert, after update,after delete,after undelete) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            leadTriggerHandler.afterInsertHandler(Trigger.new);
        }
        when AFTER_UPDATE {
            leadTriggerHandler.afterUpdateHandler(Trigger.new, Trigger.oldmap);
        }
        when AFTER_DELETE {
            leadTriggerHandler.afterDeleteHandler(Trigger.old);
        }
        when AFTER_UNDELETE {
            leadTriggerHandler.afterUndeleteHandler(Trigger.new);
        }
    }
}