library main_view;

import 'package:polymer/polymer.dart';
import 'package:intl/intl.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

//Constant variables
  static const int INVEST_AMNT = 1000;
  static const int INTEREST =  2;
  static const int START_YEAR =  1626;
  static const int CURRENT_YEAR =  2014;
  static const int YEARS_IN_BANK =  CURRENT_YEAR - START_YEAR;
  
//Observable variables
  @observable String accountMessage;
  @observable String initialInvest;
  @observable String interestRate;
  
  num accountTotal;
  
  // non-visual initialization can be done here
  MainView.created() : super.created();

  // other initialization can be done here
  @override void enteredView() {
    super.enteredView();
    print("MainView::enteredView()");
    calculateInterest();
    
//  Formatting for currency
    var f = new NumberFormat("###,###,###.00", "en_US");
    
    initialInvest = "Original investment amount: ${f.format(INVEST_AMNT)}";
    interestRate = "Annual interest rate: $INTEREST%";
    accountMessage = "Account total after $YEARS_IN_BANK years: ${f.format(accountTotal)}"; 
  }
  
  calculateInterest() {
//  Formula to calculate interest is I=Prt (Interest = Principle * rate * time)
    num interestTotal = INVEST_AMNT * (INTEREST / 100) * YEARS_IN_BANK;
    accountTotal = INVEST_AMNT + interestTotal;
  }
  
  // this lets the global CSS bleed through into the Shadow DOM of this element
  bool get applyAuthorStyles => true;
}

