import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

class NotificationsService {
  // ! get access token


  static Future<String> getAccessToken() async {
    final Map<String, String> serviceAccountJson = {
      "type": "service_account",
      "project_id": "e-commerce-a9af1",
      "private_key_id": "24d85ec31146b38148f4d5d7e68b556c8bd10659",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAqOen4p/SNPrl\nGPr3gmZ/wJ8pl+XsZmQ4IMBzXvuGI8fkpBC2ahLHIdGA/s6QGbGMptY8ijtSSW4L\ncllM7rdHRxgK8iWRAzhi+eXz25XLhl1XKjoQc4zkRkC/SCMC1JgN6mxbXyTI0V7q\nQp5Focpm/+iGNgrhIQ8gm8g2GjohUGIfJrWxTI8lT1AJmy8rjwl7NTWlEplkkqov\n9qYKXC5oGX81dFcq3Y2mNk5pw7PO04ZltugF58vdSxEnqteueI7dxudGmX/gft83\nOgIjdoSksKH0D/zcBzB4biQQBwR7v2daNQaIt/+6Zy73uObjV68ar7f9geKEQyC7\nfDuoInClAgMBAAECggEAHVOYr72Xhm/6IRWEXljDMX8ouzQcE7giWUjjAqzarLiV\nnQA8awgKg7VqJrCi0NyYYkijI+QG06fJ0IQ/g65yx67SwhfKECDlXGudzVkHnEt/\nudz7qbVtJPJsuLFKYwvpeXTNubrp5oe4YwBxBzhxjuw1gPiI/2wA2X3dJB8p6hgG\nK3yqZ+paJgJFBrOyHDNb9JEyV5rXpPmBv4Ru9UBnQ1A/lMn9MGpY2U4JNY2E6b9T\nmw3jPFKZn9qkC8wNim1XSFET69Dw57y/nGWIvf6gOp0Jnqk5U4viouVjBmiAcjMn\nSaueREd03djcFDXfZY6KdkcUogIB/R2yQTag+EPKoQKBgQD8lp+2fyASBSUGQbJx\nYJUunW5FVYrfm3gygmodfBZgs3D5f+VrTazHsz1cLKAv1XEa9R+GKTyMZZYh28/A\ncE+b2F65YLJAMowextZke7wiXzfXirVNNZ6gfbD6Zp/x1iIP7/odP1p0jfpYZtVE\neymZDIZeelXbMllg711ZvzHwEwKBgQDDQxDNZckS+uTSRo5kSbTfYngiYasOKmHx\nL1cySiHC72JxdhUhy1eKhptErKUyfeUNw+bf2uB4rmkU56uiQ9WOfODIW53WjV3u\nZSvZgpYXt+PYRsrGuccLL7Qu5uZiOy49bJ5613yDcQ0fUJUeufB/c73oKbMCNcvK\n6T/g6W7jZwKBgQCCyj+zEMp7ajyMq9IJURiORaiGsE+zj15C0TK/R7SSp/fUyXvy\n/wp7cX1RUC419pCVg92p64pVrHh72cUOgVlHelc6KC7EfSf++7ih2UxGhAV3T3Sn\noR8dPVg5oJArelSy6fEZ2ectuSKrSbwetKOKg2jEXRY95SlQv0EYKp9iDwKBgAFl\nuHgP02mMXBjZImm7UU0L8lokosm+KedE9HXKrAUuG2E+fBY600yNfAz4w1HiLsJz\ndXKCqXqTnPLmWYcWvy9+20jzxuRjLJnpJXAwDAztZvcEQq07ZR5CYCK5ykpHrCQK\nY/PzGNQD+hkQRZDrubnfxSslKT/JzMSN+MQOR5nfAoGAbwbh8d0F/F+6BCmITE7h\nFW5ejwKnBXv8x6TLRurMbRXEpjY+i1cdLw0NdG8xeovC9UoDMfcIU0hD8+MfmMLA\nwMk632hf7Edc1xPJCNkaNMXjkKtLbkZfYytKJ43leEsOO0ipt2aRRdK+d8ThQCYa\n52Zqqn2lNz1ftibf9hLTdXY=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-tlaiq@e-commerce-a9af1.iam.gserviceaccount.com",
      "client_id": "108631000510376998180",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-tlaiq%40e-commerce-a9af1.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };
  

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();
    return credentials.accessToken.data;
  }

  // ! send notification
  static Future<void> sendNotification(
    
      String deviceToken, String title, String body) async {
        
    final String accessToken = await getAccessToken();
    String endpointFCM =
        'https://fcm.googleapis.com/v1/projects/e-commerce-a9af1/messages:send';

    final Map<String, dynamic> message = {
      "message": {
        "token": deviceToken,
        "notification": {"title": title, "body": body},
        "data": {
          "route": "serviceScreen",
        }
      }
    };
    final http.Response response = await http.post(
      Uri.parse(endpointFCM),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification');
    }
  }
}
