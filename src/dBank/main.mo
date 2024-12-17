import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor dBank {
  var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now(); 
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  type Time = Time.Time;

  //let id = "198274920193081231";

  
// this function adds a 1 vunit of value to the currentValue variable

  public func topUp(amount: Float){
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

//Funct to allow user to withdraw from currentvalue, then decrease current value
  public func topDown(withdraw: Float){
    let tempValue: Float = currentValue - withdraw;
    if(tempValue>= 0 ){
      currentValue -= withdraw;
      Debug.print(debug_show(withdraw));
      Debug.print(debug_show(currentValue)); 
    } else{
      Debug.print("Not enough funds to withdraw");
    }    
  };

  public shared query func checkBalance(): async Float{
    return currentValue;
  };

  public shared func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    

  };

 

  
}