trigger ClosedOpportunityTrigger on Opportunity (after insert, after update ) {
    List<Task> tasks=new List<Task>();
    for(Opportunity opp:Trigger.new){
        if (opp.StageName == 'Closed Won' &&
        (Trigger.isInsert || (Trigger.isUpdate && opp.StageName != Trigger.oldMap.get(opp.Id).StageName))) {
            Task tsk = new Task();
            tsk.Subject = 'Follow Up Test Task';
            tsk.WhatId = opp.Id;
            tasks.add(tsk);
        }
    }
    if(tasks.size()>0){
        insert tasks;
    }
}