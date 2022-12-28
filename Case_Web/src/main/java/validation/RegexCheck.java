package validation;

public class RegexCheck {
    private static final String NAME_REGEX = "^([A-Z][a-z]+[ ])+([A-Z][a-z]+)$";
    private static final String EMAIL_REGEX = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    private static final String PHONE_NUMBER_REGEX = "^((\\+84|0)9)\\d{8}$";
    private static final String ID_CARD_REGEX = "^((\\d{9})|(\\d{11}))$";

    public static boolean checkName(String name) {
        return name.matches(NAME_REGEX);
    }

    public static boolean checkEmail(String email) {
        return email.matches(EMAIL_REGEX);
    }

    public static boolean checkPhoneNumber(String phoneNumber) {
        return phoneNumber.matches(PHONE_NUMBER_REGEX);
    }

    public static boolean checkIdCard(String idCard) {
        return idCard.matches(ID_CARD_REGEX);
    }
}
