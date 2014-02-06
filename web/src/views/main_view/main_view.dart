library main_view;

import 'package:polymer/polymer.dart';
import 'package:intl/intl.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {
  
//Constants
  static const int INVEST_AMNT = 1000;
  static const num INTEREST =  .02;
  static const int START_YEAR =  1626;
  
//Observable variables
  @observable String accountMessage;
  @observable String initialInvest;
  @observable String interestRate;
  
  num accountTotal;
  int yearsInBank;
  
  // non-visual initialization can be done here
  MainView.created() : super.created() {
    print("MainView::created()");
     
    yearsInBank =  new DateTime.now().year - START_YEAR;
    
    calculateInterest();
    
//  Formatting for currency
    NumberFormat f = new NumberFormat("###,###,###.00");
    
    initialInvest = "Original investment amount: \$${f.format(INVEST_AMNT)}";
    interestRate = "Annual interest rate: ${(INTEREST * 100).floor()}%";
    accountMessage = "Account total after $yearsInBank years: \$${f.format(accountTotal)}"; 
  }

  // other initialization can be done here
  @override void enteredView() {
    super.enteredView();
    print("MainView::enteredView()");
  }
  
  void calculateInterest() {
//  Formula to calculate interest is I=Prt (Interest = Principle * rate * time)
    num interestTotal = INVEST_AMNT * INTEREST * yearsInBank;
    accountTotal = INVEST_AMNT + interestTotal;
  }
  
  // this lets the global CSS bleed through into the Shadow DOM of this element
  bool get applyAuthorStyles => true;
}

