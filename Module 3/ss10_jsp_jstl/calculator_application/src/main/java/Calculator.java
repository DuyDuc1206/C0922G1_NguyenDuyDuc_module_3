public class Calculator {
    public static float calculate(float firstNumber, float secondNumber, char operator) {
        switch (operator) {
            case '+':
                return firstNumber + secondNumber;
            case '-':
                return firstNumber - secondNumber;
            case '*':
                return firstNumber * secondNumber;
            default:
                if (secondNumber == 0) {
                    throw new ArithmeticException("not division for 0");
                } else {
                    return firstNumber / secondNumber;
                }
        }
    }
}
