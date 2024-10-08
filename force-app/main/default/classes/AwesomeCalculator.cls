public with sharing class AwesomeCalculator {
    public static double addition(Integer x, Integer y){
        calculatorServices.CalculatorImplPort calculator=new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x, y);
    }
}