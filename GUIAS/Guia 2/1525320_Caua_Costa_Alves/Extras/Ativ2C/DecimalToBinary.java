public class DecimalToBinary {

    /**
     * Converte um número decimal (double) para binário.
     * @param x O número decimal.
     * @return A string representando o número binário.
     */
    public static String double2bin(double x) {
        if (x == 0) return "0.0";

        StringBuilder binary = new StringBuilder();
       
        int intPart = (int) x;
        double fractionPart = x - intPart;

        
        binary.append(Integer.toBinaryString(intPart));
        binary.append(".");

        
        while (fractionPart > 0 && binary.length() < 64) { 
            fractionPart *= 2;
            int fractionBit = (int) fractionPart;
            binary.append(fractionBit);
            fractionPart -= fractionBit;
        }

        return binary.toString();
    }

    public static void main(String[] args) {
        
        double[] numbers = {0.375, 2.125, 3.625, 5.03125, 6.75};

        for (double num : numbers) {
            System.out.println(num + " = " + double2bin(num));
        }
    }
}
