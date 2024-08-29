public class Ativ_1C {

    public static int C1(int nbits, int x) {
        int maxValue = (1 << nbits) - 1;
        return maxValue - x;
    }

    public static int C2(int nbits, int x) {
        return C1(nbits, x) + 1;
    }

    public static String toBinaryString(int value, int nbits) {
        String binString = Integer.toBinaryString(value);
        while (binString.length() < nbits) {
            binString = "0" + binString;
        }
        return binString;
    }

    public static void main(String[] args) {
        // Teste dos exemplos
        int[][] values = {
            {6, 0b101010},
            {8, 0b00001101},
            {6, 0b101001},
            {7, 0b101111},
            {8, 0b11010000}
        };

        String[] labels = {
            "a = 101010 (6 bits)",
            "b = 00001101 (8 bits)",
            "c = 101001 (6 bits)",
            "d = 101111 (7 bits)",
            "e = 11010000 (8 bits)"
        };

        for (int i = 0; i < values.length; i++) {
            int nbits = values[i][0];
            int value = values[i][1];
            System.out.println(labels[i]);
            int c1Value = C1(nbits, value);
            int c2Value = C2(nbits, value);
            System.out.printf("C1(%d, %s) = %s\n", nbits, toBinaryString(value, nbits), toBinaryString(c1Value, nbits));
            System.out.printf("C2(%d, %s) = %s\n", nbits, toBinaryString(value, nbits), toBinaryString(c2Value, nbits));
            System.out.println();
        }
    }
}
