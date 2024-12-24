package book.mgmt.utils;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyUtil {
    private static final NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.getDefault());

    // Parse a currency string to BigDecimal
    public static BigDecimal parseCurrency(String currencyString) throws NumberFormatException {
        try {
            // Remove non-numeric characters except for decimal point
            String cleanString = currencyString.replaceAll("[^\\d.]", "");
            return new BigDecimal(cleanString);
        } catch (NumberFormatException e) {
            throw new NumberFormatException("Invalid currency format: " + currencyString);
        }
    }

    // Format BigDecimal to currency string
    public static String formatCurrency(BigDecimal amount) {
        return currencyFormat.format(amount);
    }

    // Validate a currency string format
    public static boolean isValidCurrencyFormat(String currencyString) {
        try {
            parseCurrency(currencyString);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
