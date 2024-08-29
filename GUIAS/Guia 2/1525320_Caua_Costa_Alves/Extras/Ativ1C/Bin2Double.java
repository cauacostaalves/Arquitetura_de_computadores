public class Bin2Double {

    /**
     * Converte uma string de número binário em ponto fixo para um valor decimal.
     * @param binaryStr A string de número binário.
     * @return O valor decimal correspondente.
     */
    public static double bin2double(String binaryStr) {
        double x = 0.0;
        double power2 = 1.0;

        // Itera pelos bits da string binária, começando do mais significativo
        for (char bit : binaryStr.toCharArray()) {
            power2 /= 2.0;
            if (bit == '1') {
                x += power2;
            }
        }

        return x;
    }

    public static void main(String[] args) {
        // Define os valores binários como strings
        String[] binValues = {
            "00011000",  // Exemplo a
            "01001000",  // Exemplo b
            "10101000",  // Exemplo c
            "11110100",  // Exemplo d com 1.11101000
            "11100100"   // Exemplo e com 11.11001000
        };

        // Converte e exibe cada valor binário
        for (String b : binValues) {
            double x;
            // Ajusta para incluir a parte inteira '1.' ou '11.' conforme necessário
            if (b.startsWith("1")) {
                x = bin2double(b.substring(1)) + 1; // Ajusta para incluir a parte inteira '1.'
            } else {
                x = bin2double(b);
            }

            System.out.printf("b = %s, x = %.6f%n", b, x);
        }
    }
}
