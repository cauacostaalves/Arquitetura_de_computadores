public class BinArithmetic {

    /**
     * Avalia uma expressão binária com base em uma operação.
     * @param bin1 O primeiro número binário.
     * @param op O operador ("+" para adição, "-" para subtração, "*" para multiplicação, "/" para divisão, "%" para módulo).
     * @param bin2 O segundo número binário.
     * @return O resultado da operação como uma string binária.
     */
    public static String dbinEval(String bin1, String op, String bin2) {
        // Converter binários para decimais
        double decimal1 = binaryToDecimal(bin1);
        double decimal2 = binaryToDecimal(bin2);

        double result = 0;
        switch (op) {
            case "+":
                result = decimal1 + decimal2;
                break;
            case "-":
                result = decimal1 - decimal2;
                break;
            case "*":
                result = decimal1 * decimal2;
                break;
            case "/":
                result = decimal1 / decimal2;
                break;
            case "%":
                result = decimal1 % decimal2;
                break;
            default:
                throw new IllegalArgumentException("Operador não suportado: " + op);
        }

        // Converter o resultado decimal de volta para binário
        return decimalToBinary(result);
    }

    private static double binaryToDecimal(String binary) {
        String[] parts = binary.split("\\.");
        String intPart = parts[0];
        String fracPart = parts.length > 1 ? parts[1] : "";

        // Converte a parte inteira
        int intValue = Integer.parseInt(intPart, 2);

        // Converte a parte fracionária
        double fracValue = 0.0;
        for (int i = 0; i < fracPart.length(); i++) {
            if (fracPart.charAt(i) == '1') {
                fracValue += Math.pow(2, -(i + 1));
            }
        }

        return intValue + fracValue;
    }

    private static String decimalToBinary(double decimal) {
        // Parte inteira
        int intPart = (int) decimal;
        StringBuilder binaryIntPart = new StringBuilder();
        while (intPart > 0) {
            binaryIntPart.insert(0, intPart % 2);
            intPart /= 2;
        }

        // Parte fracionária
        double fracPart = decimal - (int) decimal;
        StringBuilder binaryFracPart = new StringBuilder();
        while (fracPart > 0 && binaryFracPart.length() < 64) { // Limite de precisão
            fracPart *= 2;
            int bit = (int) fracPart;
            binaryFracPart.append(bit);
            fracPart -= bit;
        }

        if (binaryIntPart.length() == 0) {
            binaryIntPart.append("0");
        }

        return binaryIntPart.append('.').append(binaryFracPart).toString();
    }

    public static void main(String[] args) {
        // Testa as operações fornecidas
        System.out.println("a) 101.11 + 10.011 = " + dbinEval("101.11", "+", "10.011"));
        System.out.println("b) 1000.101 - 10.01 = " + dbinEval("1000.101", "-", "10.01"));
        System.out.println("c) 101.101 * 10.101 = " + dbinEval("101.101", "*", "10.101"));
        System.out.println("d) 10111.01 / 11.011 = " + dbinEval("10111.01", "/", "11.011"));
        System.out.println("e) 1101011 % 1101 = " + dbinEval("1101011", "%", "1101"));
    }
}
