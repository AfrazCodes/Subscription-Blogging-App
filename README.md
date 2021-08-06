# Subscription Blogging App: Thoughts for iOS

![Thoughts iOS Header](https://raw.githubusercontent.com/AfrazCodes/Subscription-Blogging-App/master/header.png)

## 1. Overview

A modern blogging iOS app written in Swift with subscription paywalls powered by RevenueCat. This iPhone client app offers the ability for users to authenticate, author posts, view their profile, and browse posts by other users. The code is designed as a mix of MVC and MVVM architecture (mostly MVC). Firebase and RevenueCat libraries are leveraged for in app purchase and backend functionality (detailed below).

[Watch Series where this app is built](https://www.youtube.com/playlist?list=PL5PR3UyfTWvc6DLxny-s7rcClqEGjqLfN).

## 2. Authentication

The app supports creating, signing in, and signing out of accounts. The auth method support is via an Email and Password combination. This can be extended to offer SSO providers via firebase.

## 3. Database / Storage

Firebase Firestore, a document collection based database, is used to save data on the backend. This includes information about users and posts. In addition, Firebase Storage is used to store user profile pictures and post header images.

## 4. In App Purchases

In App Purchases are configured in Apple's App Store Connect. Moreover, RevenueCat is leveraged to offer subscriptio flows, entitlement checks, and restorations. The project brings in the PurchasesSDK to provide this functionality. Lastly, the project offers a single Premium Subscription to Thoughts+.

## 5. Other Information

To run the project, you'll need to set up your own Firebase instance for the backend. This is free but required as the project is bundled with a test firebase set up. Additionally, you'll need to configure in app purchases in App Store Connect and RevenueCat's dashboard.

I encourage you to check out the [Step by Step series where we build this app from scatch](https://www.youtube.com/playlist?list=PL5PR3UyfTWvc6DLxny-s7rcClqEGjqLfN).

![Thoughts iOS footer](https://raw.githubusercontent.com/AfrazCodes/Subscription-Blogging-App/master/footer.png)
