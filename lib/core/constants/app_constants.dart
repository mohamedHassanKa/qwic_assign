///The app base Url

const String baseUrl = 'https://sp82l5ulp2.execute-api.eu-west-1.amazonaws.com';

/// http client header constants
const String acceptLanguageKey = 'Accept-Language';
const String authorisationKey = 'Authorization';
const String bearerKey = 'Bearer ';
const String contentTypeKey = 'Content-Type';
const String contentTypeValue = 'application/json';
const String contentMutlipartTypeValue = 'multipart/form-data';
const String userPhoneNumberKey = 'userPhoneNumber';
const String deviceIDHeader = 'X-Device-Id';

/// app uris
const String productDetailUrl = '/bikeDetails';

///time out duration
const Duration timeout = Duration(seconds: 15);
