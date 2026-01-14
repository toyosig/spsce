// lib/utils/validators/form_validators.dart

class FormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  static String? validateAddressLine1(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address 1 is required';
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }

    try {
      final dob = DateTime.parse(value);
      final today = DateTime.now();
      final age =
          today.year -
          dob.year -
          ((today.month < dob.month ||
                  (today.month == dob.month && today.day < dob.day))
              ? 1
              : 0);

      if (age < 13) {
        return 'You must be at least 13 years old';
      }
    } catch (e) {
      return 'Invalid date format (yyyy-MM-dd)';
    }

    return null;
  }

  static String? validateAddressLine2(String? value) {
    // Allow empty (optional field)
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    // Optionally, add further validation for non-empty values
    return null;
  }

  static String? validateArea(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Area is required';
    }

    final sanitized = value.trim();

    // City names should be at least 2 characters
    if (sanitized.length < 2) {
      return 'City name is too short';
    }

    // City names shouldn't be overly long
    if (sanitized.length > 50) {
      return 'City name is too long';
    }

    // City names typically consist of letters and may include spaces or hyphens
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(sanitized)) {
      return 'City name must contain only letters, spaces, or hyphens';
    }

    return null;
  }

  static String? validateState(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'State is required';
    }

    final sanitized = value.trim();

    // State names should be at least 2 characters
    if (sanitized.length < 2) {
      return 'State name is too short';
    }

    // State names shouldn't be overly long
    if (sanitized.length > 50) {
      return 'State name is too long';
    }

    // State names typically consist of letters and may include spaces or hyphens
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(sanitized)) {
      return 'State name must contain only letters, spaces, or hyphens';
    }

    return null;
  }

  static String? validateAccountNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Account number is required';
    }

    final sanitized = value.replaceAll(' ', '').toUpperCase();

    // Check length first (IBAN length ranges from 15 to 34 characters)
    if (sanitized.length < 8 || sanitized.length > 34) {
      return 'Account Number must be between 8 and 34 characters';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    // Remove spaces and hyphens
    final sanitized = value.replaceAll(RegExp(r'\s+|-'), '');

    // Check length (E.164 format allows max 15 digits)
    if (sanitized.length < 7 || sanitized.length > 15) {
      return 'Phone number must be between 7 and 15 digits';
    }

    // Check if it starts with "+" or a digit
    if (!RegExp(r'^[+0-9]').hasMatch(sanitized)) {
      return 'Phone number must start with a "+" or a digit';
    }

    // Ensure the rest is digits (after optional +)
    if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(sanitized)) {
      return 'Phone number must contain only digits and optionally a leading "+"';
    }

    return null;
  }

  static String? validateStreetAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Street address is required';
    }

    final sanitized = value.trim();

    // Basic length check (min 5 chars, max 100 for sanity)
    if (sanitized.length < 5) {
      return 'Street address is too short';
    }

    if (sanitized.length > 100) {
      return 'Street address is too long';
    }

    // Allow common address characters; require at least one letter
    if (!RegExp(r'^[A-Za-z0-9\s\.,\-#/]+$').hasMatch(sanitized)) {
      return 'Street address contains invalid characters';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(sanitized)) {
      return 'Street address must contain letters';
    }

    return null;
  }

  static String? validateBankName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Bank name is required';
    }

    final sanitized = value.trim();

    // Bank name must be at least 3 characters
    if (sanitized.length < 3) {
      return 'Bank name is too short';
    }

    // Limit to avoid very long entries (spam or error)
    if (sanitized.length > 60) {
      return 'Bank name is too long';
    }

    // Allow letters, spaces, hyphens, and apostrophes (e.g., "Al-Rajhi", "O'Reilly Bank")
    if (!RegExp(r"^[a-zA-Z\s\-\']+$").hasMatch(sanitized)) {
      return 'Bank name must contain only letters, spaces, hyphens, or apostrophes';
    }

    return null;
  }

  static String? validateBankVerificationNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Bank Verification Number is required';
    }

    final sanitized = value.trim();

    // Check if the value is exactly 11 digits
    if (!RegExp(r'^\d{11}$').hasMatch(sanitized)) {
      return 'BVN must be exactly 11 digits and contain only numbers';
    }

    return null;
  }

  static String? validateNIN(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'NIN is required';
    }

    final sanitized = value.trim();

    // Must be exactly 11 digits and contain only numbers
    if (!RegExp(r'^\d{11}$').hasMatch(sanitized)) {
      return 'NIN must be exactly 11 digits and contain only numbers';
    }

    return null;
  }

  static String? validateAccountHolderName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Account holder name is required';
    }

    final sanitized = value.trim();

    // Name must be at least 3 characters
    if (sanitized.length < 3) {
      return 'Name is too short';
    }

    // Limit to avoid very long entries
    if (sanitized.length > 50) {
      return 'Name is too long';
    }

    // Allow only alphabets, spaces, hyphens, and apostrophes
    if (!RegExp(r"^[a-zA-Z\s\-\']+$").hasMatch(sanitized)) {
      return 'Name must contain only letters, spaces, hyphens, or apostrophes';
    }

    // Prevent names with only special characters or spaces
    if (!RegExp(r"[a-zA-Z]").hasMatch(sanitized)) {
      return 'Name must contain at least one letter';
    }

    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }

    final sanitized = value.trim();

    // Check if it's a valid number (integer or decimal)
    if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(sanitized)) {
      return 'Enter a valid amount (up to 2 decimal places)';
    }

    // Parse the value to double for further checks
    final amount = double.tryParse(sanitized);
    if (amount == null) {
      return 'Invalid amount';
    }

    if (amount <= 0) {
      return 'Amount must be greater than zero';
    }

    if (amount > 1000000) {
      return 'Amount exceeds the maximum allowed limit';
    }

    return null;
  }

  static String? validateWithdrawAccountNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Account number is required';
    }

    final sanitized = value.trim();

    // Must contain only digits
    if (!RegExp(r'^\d+$').hasMatch(sanitized)) {
      return 'Account number must contain only digits';
    }

    // Typical account numbers are between 8 and 20 digits
    if (sanitized.length < 8) {
      return 'Account number is too short';
    }

    if (sanitized.length > 20) {
      return 'Account number is too long';
    }

    return null;
  }

  static String? validateReason(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Reason is required';
    }

    final sanitized = value.trim();

    // Check minimum length
    if (sanitized.length < 10) {
      return 'Reason must be at least 10 characters';
    }

    // Check maximum length (200 characters as mentioned in hint)
    if (sanitized.length > 200) {
      return 'Reason cannot exceed 200 characters';
    }

    return null;
  }
}
