public with sharing class AddPrimaryContact implements Queueable{
    public Contact con;
    public String state;
    public AddPrimaryContact(Contact con,String state){
        this.con=con;
        this.state=state;
    }
    public void execute(QueueableContext QC){
        List<Account> accounts=[SELECT Id from Account WHERE BillingState=:this.state LIMIT 200];
        List<Contact> cons=new List<Contact>();
        for (Account acc : accounts) {
            Contact con=this.con.clone(false,false,false,false);
            con.AccountId=acc.Id;
            cons.add(con);
        }
        insert cons;
    }
}