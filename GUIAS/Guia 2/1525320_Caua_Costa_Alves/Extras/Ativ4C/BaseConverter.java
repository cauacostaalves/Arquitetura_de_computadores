public class BaseConverter {

    /**
     * Converte um número de uma base para outra.
     * @param base1 A base original do número.
     * @param base2 A base para a qual converter.
     * @param x O número na base original como uma string.
     * @return O número convertido para a base especificada.
     */
    public static String dbase2base(int base1, int base2, String x) {
        // Substituir vírgulas por pontos para conformidade com a notação decimal
        x = x.replace(',', '.');

        // Converte o número de base1 para decimal
        double decimalValue = base1ToDecimal(base1, x);

        // Converte o número decimal para a base2
        return decimalToBase(base2, decimalValue);
    }

    private static double base1ToDecimal(int base1, String x) {
        String[] parts = x.split("\\.");
        String intPart = parts[0];
        String fracPart = parts.length > 1 ? parts[1] : "";

        // Converte a parte inteira
        int intValue = Integer.parseInt(intPart, base1);

        // Converte a parte fracionária
        double fracValue = 0.0;
        for (int i = 0; i < fracPart.length(); i++) {
            int digit = Character.digit(fracPart.charAt(i), base1);
            if (digit == -1) {
                throw new NumberFormatException("Invalid character for base " + base1);
            }
            fracValue += digit * Math.pow(base1, -(i + 1));
        }

        return intValue + fracValue;
    }

    private static String decimalToBase(int base2, double decimalValue) {
        if (base2 == 10) return Double.toString(decimalValue);

        StringBuilder result = new StringBuilder();
        int intPart = (int) decimalValue;
        double fracPart = decimalValue - intPart;

        // Converte a parte inteira
        result.append(Integer.toString(intPart, base2).toUpperCase());

        if (fracPart > 0) {
            result.append(".");
            // Converte a parte fracionária
            while (fracPart > 0 && result.length() < 64) { // Limita a 64 caracteres
                fracPart *= base2;
                int digit = (int) fracPart;
                result.append(Integer.toString(digit, base2).toUpperCase());
                fracPart -= digit;
            }
        }

        return result.toString();
    }

    public static void main(String[] args) {
        // Testa com exemplos fornecidos
        String[] examples = {
            "0.321",  // base 4 para base 2
            "0.3D2",  // base 16 para base 4
            "0.751",  // base 8 para base 2
            "7.345",  // base 8 para base 4
            "F.A5E"   // base 16 para base 4
        };
        int[] fromBases = {4, 16, 8, 8, 16};
        int[] toBases = {2, 4, 2, 4, 4};

        for (int i = 0; i < examples.length; i++) {
            System.out.println(examples[i] + " in base " + fromBases[i] + " = " +
                               dbase2base(fromBases[i], toBases[i], examples[i]));
        }
    }
}
