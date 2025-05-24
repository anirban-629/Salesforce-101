global with sharing class MyClass {
    private void name() {
        Schema.DescribeSObjectResult acc_describe = Account.SObjectType.getDescribe();
        Map<String,Schema.SObjectField> acc_fields= acc_describe.fields.getMap();
        for (Schema.SObjectField value: acc_fields.values()) {
            System.debug(
                'Field Name - ' + value
                );
        }
    }
    private void name2() {
        Schema.DescribeSObjectResult acc_describe = Account.SObjectType.getDescribe();
        List<Schema.ChildRelationship>  lstOfChldRltnShp= acc_describe.getChildRelationships();
        integer i=0;
        for (Schema.ChildRelationship rltnshp : lstOfChldRltnShp) {
            System.debug(i+'--->'+rltnshp.getChildSObject());
            System.debug(i+'--->'+rltnshp.childsobject);
            System.debug(i+'--->'+rltnshp.getField());
            System.debug(i+'--->'+rltnshp.getJunctionIdListNames());
            i++;
        }
    }
    private void name3() {
        List<Schema.DescribeTabSetResult>  tabSetResult = Schema.describeTabs();
        for (Schema.DescribeTabSetResult tabResult : tabSetResult) {
            String appLabel=tabResult.getLabel();
            if(appLabel=='Sales'){
                List<Schema.DescribeTabResult> tabDesc=tabResult.getTabs();
                for (Schema.DescribeTabSetResult result : tabSetResult) {
                    System.debug('Label - ' + result.getLabel());
                }
            }
        }
    }
    private void name4() {
        Map<String, Schema.SObjectType> m = Schema.getGlobalDescribe();
        Schema.SObjectType accObj=m.get('Account');
        Schema.DescribeSObjectResult descAccount=accObj.getDescribe();
        System.debug('Account Object - ' + descAccount);
        Map<String, Schema.SObjectField> fields = descAccount.fields.getMap();
        List<string> lstReqFields = new List<String>();
        for (String f : fields.keySet()) {
            Schema.DescribeFieldResult fieldDesc=fields.get(f).getDescribe();
            if (
                fieldDesc.isCreateable() &&
                !fieldDesc.isNillable() &&
                !fieldDesc.isDefaultedOnCreate()
            ) {
                lstReqFields.add(f);
            }
        }
        System.debug('Required fields - ' + lstReqFields);
    }
}