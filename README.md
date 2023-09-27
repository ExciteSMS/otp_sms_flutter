# Excite SMS OTP Flutter Application

This is a Flutter application for sending and verifying one-time passwords (OTPs) via SMS using the Excite SMS API. You can use this mobile app to generate OTPs, send them to recipients, and verify OTPs for authentication.

![Excite SMS OTP Flutter Application](screenshot.png)

## Features

- Generate and send OTPs via SMS using the Excite SMS API.
- User-friendly interface with recipient input field and OTP verification.
- Confirmation message for successful or failed OTP generation and verification.

## Technologies Used

- Flutter for building the mobile app.
- HTTP package for making API requests.
- Provider for state management.

## Getting Started

To get started with this application, follow these steps:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/your-username/otp-sms-flutter.git
   cd otp-sms-flutter

2. Open the project in your favorite Flutter development environment.

3. Replace `'YOUR_API_KEY_HERE'` in the `lib/main.dart` file with your actual Excite SMS API key.

4. Run the Flutter app on a simulator or connected device:

   ```bash
   flutter run
   ```

5. Use the app to generate, send, and verify OTPs using the Excite SMS API.

## Usage

1. Enter the recipient's phone number and tap the "Send OTP" button to generate and send an OTP via SMS.
2. Enter the OTP received via SMS into the "Enter OTP" field and tap the "Verify OTP" button to verify.
3. A confirmation message will indicate whether OTP generation and verification were successful.

## API Configuration

To use this application, you need to configure the Excite SMS API credentials by replacing `'YOUR_API_KEY_HERE'` with your actual API key in the `lib/main.dart` file.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Excite SMS for providing the SMS gateway API.

---

Secure your application with OTPs using the Excite SMS OTP Flutter app!
```

Replace placeholders with your specific project details, such as the repository URL and your API key. This README provides essential information for users to understand how to use your Excite SMS OTP Flutter application. Don't forget to include an actual screenshot (`screenshot.png`) of your app to give users a visual preview.