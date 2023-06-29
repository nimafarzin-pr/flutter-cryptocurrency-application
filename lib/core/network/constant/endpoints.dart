enum ApiType { coinApi, cryptoWatch }

class Endpoints {
  // //! coin api
  static const coinApiApiKey = "D4C38617-E10E-46F7-9998-BD8238441432";
  static const coinApiKey = 'X-CoinAPI-Key';

  //! coin market cap
  static const coinMarketCapApiKey = "53df9801-6d73-4fd9-80bf-c06af2daed13";
  static const coinMarketCapKey = 'X-CMC_PRO_API_KEY';

  //! coin cap api
  static const coinCapApiKeyValue =
      "Bearer d4b8bf8c-88f9-4cc9-bfa4-49cd96ce01a1";
  static const coinCapApiKey = 'Authorization';

  static Map<ApiType, String> baseUrl = {
    ApiType.coinApi: "https://api.coincap.io/",
    ApiType.cryptoWatch: "https://api.cryptowat.ch/"
  };

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
