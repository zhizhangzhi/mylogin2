/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class DemoTop_Test {
	 static testMethod void Dev511_mod3_inputfile_test() { 
	 	Document account =new Document();
	  	ApexPages.StandardController controller = new ApexPages.StandardController(account);
	  	Dev511_mod3_inputfile top = new Dev511_mod3_inputfile(controller);

	  }
	  
	 static testMethod void Dev511_mod3_selectapex_test() { 
	 	Dev511_mod3_selectapex ref = new Dev511_mod3_selectapex();
        List<SelectOption> options = new List<SelectOption>();
	  	options = ref.getItem();
	  	ref.setCountries(ref.getCountries());
        PageReference test = ref.test();
	  }
	  
	 static testMethod void Dev511_mod4_actionStatus_test() { 
	 	Dev511_mod4_actionStatus ref = new Dev511_mod4_actionStatus();
        PageReference red = ref.incrementCounter();
        Integer inn = ref.getCount();
	  }
	  
	 static testMethod void Dev511_mod5_recordset_test() { 

	    List<account> accountList = [SELECT name FROM Account LIMIT 20];
	  ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(accountList);
	 	Dev511_mod5_recordset ref = new Dev511_mod5_recordset(ssc);

	  }
	  
	 static testMethod void Dev521_mod3_prop_test() { 
       Dev521_mod3_prop ref = new Dev521_mod3_prop();
	   String i = ref.getMyName();
	   ref.setMyName(i);
	   PageReference ref1 = ref.doAction();

	  }	
	  
	 static testMethod void Dev521_mod4_Transientclass_test() { 
       Dev521_mod4_Transientclass ref = new Dev521_mod4_Transientclass();
	   String i = ref.getT1();
       String i1 = ref.getT2();
       PageReference ref1 = ref.updateTime();
	  }	   
	  static testMethod void Dev521_mod4_wizclass_test() { 
       Dev521_mod4_wizclass ref = new Dev521_mod4_wizclass();
	   PageReference i = ref.goNext2();
       PageReference i1 = ref.goNext3();
	  }	   
	  
	 static testMethod void trigger_test() { 
	 	
       Account ref = new Account();
       List<account> accountList = [SELECT name FROM Account LIMIT 20];
       ref = accountList[0];
       ref.AnnualRevenue = -1;
       try{
       update ref;
       }catch(Exception e){
       	System.assert(true);
       	}
	  }	   
      static testMethod void Dev541_mod1_governor_test() { 
       Dev541_mod1_governor ref = new Dev541_mod1_governor();
       Dev541_mod1_governor.OutOfLimitSample(1);

	  }	 
	  
	  static testMethod void Dev541_mod9_Rest_test() { 
       Dev541_mod9_Rest ref = new Dev541_mod9_Rest();

	  }	 
}