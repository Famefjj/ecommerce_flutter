enum OrderStatus { processing, shipped, delivered }

enum PaymentMethods { applePay, visa, masterCard, creditCard }

enum CountryLocale { th, us }

extension CountryLocaleValue on CountryLocale {
  String get localeCode {
    return switch (this) {
      CountryLocale.th => 'th_TH',
      CountryLocale.us => 'en_US',
    };
  }

  String get currencySymbol {
    return switch (this) {
      CountryLocale.th => '\u0E3F',
      CountryLocale.us => '\$',
    };
  }
}
