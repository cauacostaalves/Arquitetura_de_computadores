public class BinToBase {

    /**
     * Converte um número binário em ponto fixo para um número em uma base especificada.
     * @param base A base para a qual converter (2, 4, 8, 16).
     * @param binStr A string representando o número binário em ponto fixo.
     * @return A string representando o número convertido para a base especificada.
     */
    public static String dbin2base(int base, String binStr) {
        String[] parts = binStr.split("\\.");
        String intPart = parts[0];
        String fracPart = parts.length > 1 ? parts[1] : "";

        // Converte a parte inteira
        String intResult = convertBinaryPartToBase(intPart, base);

        // Converte a parte fracionária
        String fracResult = convertFractionalBinaryPartToBase(fracPart, base);

        return intResult + "." + fracResult;
    }

    private static String convertBinaryPartToBase(String binary, int base) {
        if (binary.isEmpty()) return "0";

        int value = Integer.parseInt(binary, 2);
        return Integer.toString(value, base).toUpperCase();
    }

    private static String convertFractionalBinaryPartToBase(String binary, int base) {
        if (binary.isEmpty()) return "0";

        double value = 0;
        for (int i = 0; i < binary.length(); i++) {
            if (binary.charAt(i) == '1') {
                value += Math.pow(2, -(i + 1));
            }
        }

        StringBuilder result = new StringBuilder();
        while (value > 0 && result.length() < 10) { // Limita o número de dígitos para evitar loops infinitos
            value *= base;
            int digit = (int) value;
            result.append(Integer.toString(digit, base).toUpperCase());
            value -= digit;
        }

        return result.toString();
    }

    public static void main(String[] args) {
        // Testa com exemplos fornecidos
        String[] binValues = {
            "0.011110",  // para base 4
            "0.101001",  // para base 8
            "0.100110",  // para base 16
            "1.111011",  // para base 8
            "1101.1001"  // para base 16
        };
        int[] bases = {4, 8, 16, 8, 16};

        for (int i = 0; i < binValues.length; i++) {
            System.out.println(binValues[i] + " = " + dbin2base(bases[i], binValues[i]));
        }
    }
}
