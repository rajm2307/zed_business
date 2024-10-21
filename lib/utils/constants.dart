
import 'package:zed_business/functions/custom/generate_Md5.dart';

const baseUrl = "https://svnapl.in/";
const apiUrl = "https://svnapl.in/api/v2/api.php";

const bharatBaseUrl = "http://88.198.61.79:8001/";
const bharatApiUrl = "http://88.198.61.79:8001/api";

var apiKey = generateMd5("_SVN_PAY_APL_Inv!nc!ble##");

const testToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJTUDA5MDkyMDA5IiwiZW1haWwiOiJiaGFyYXRiaGFuZGFyaTEwMjRAZ21haWwuY29tIiwibmFtZSI6IlNWTiBQQVkiLCJpYXQiOjE3MjQ2NTA1NjksImV4cCI6MTcyODEwNjU2OX0.hww_81aSRXfbQDtc61B9giJ30oMETOmFbFzOEXRSKME";

// App Version
const appVersion = 1.0;

// PhonePe Gateway
const pgEnvironment = "PRODUCTION";
const merchantId = "M2234XO7738OX";
const merchantUserId = "8477881141";
const saltKey = "628826af-77db-4de6-ac6e-71d9f16b8059";
const saltIndex = "1";
const callbackUrl = "https://svnapl.in/api/v2/phonpeCallback.php";
const appId = "";
const apiEndPoint = "/pg/v1/pay";