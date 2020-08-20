Introduction
Demonstrate proficiency of prior material, and challenge yourself to demonstrate how to apply new concepts to meet functional requirements. Build an application for recording food waste. Practice applying the concepts of location services, camera / image picker, permissions, forms, navigation, lists, asynchronous programming, streams, and Firebase backend services. Enhance your application with analytics, crash reporting, accessibility, internationalization, debugging and automated testing.

Note: This is the portfolio assignment.
Learning Outcomes
Obtain device location information and integrate the use of the camera or photo gallery. (Week 9 MLO 1)
Demonstrate persistence with remote storage services, such as Firebase Cloud Storage and a Firestore database. (Week 9 MLOs 2 & 3 )
Invoke asynchronous methods, employ navigation, capture form data, and display data in ListView components and detail screens. (Week 7 MLOs 2 - 4)
Implement unit tests to validate application behavior. (Week 10 MLO 1)
Incorporate the Semantics widget to facilitate accessibility features of native platforms. (Week 10 MLO 2)
Demonstrate the use of analytics, crash reporting, and debugging tools (Week 10 MLOs 3 & 4)
Scenario
Your client, Matthew Peter, is the owner of TwentySix Cafe, a Portland coffee shop.

"Man, I am so tired of these wasted bagels and pastries we have at the end of every day!" he says. "I'm losing money, and it's so wasteful... I feel like there's an episode of Portlandia about this. I mean, why waste a donut? A donut!"

Mr. Peter wants his employees to run an application that, "is like Instagram, but for food waste," he says. Every night the person closing the shop can gather up the leftover baked goods, take out their phone, start the app, and create a post consisting of a photo of the wasted food and the number of leftover items.

"If only I could see a list of these posts over time, then at least I'd know how much money I'm losing, and I could make adjustments to my pastry orders," he says, dreamily. "No more forsaken donuts!"

You have engaged Matthew Peter in a paid contract to develop a functioning version of the application that he and his employees can try out at the coffee shop. "Hey, I know," he says, "Let's call it Wasteagram."

What to Do
Implement Wasteagram, a mobile app that enables coffee shop employees to document daily food waste in the form of "posts" consisting of a photo, number of leftover items, the current date, and the location of the device when the post is created. The application should also display a list of all previous posts. After discussing the requirements with the client and sketching out the UX flow, your design notebook describes the app like this:

The functional requirements are:

Display a circular progress indicator when there are no previous posts to display in the List Screen.
The List Screen should display a list of all previous posts, with the most recent at the top of the list.
Each post in the List Screen should be displayed as a date, representing the date the post was created, and a number, representing the total number of wasted items recorded in the post.
Tapping on a post in the List Screen should cause a Detail Screen to appear. The Detail Screen's back button should cause the List Screen to appear.
The Detail Screen should display the post's date, photo, number of wasted items, and the latitude and longitude that was recorded as part of the post.
The List Screen should display a large button at the center bottom area of the screen.
Tapping on the large button enables an employee to capture a photo, or select a photo from the device's photo gallery.
After taking a new photo or selecting a photo from the gallery, the New Post screen appears.
The New Post screen displays the photo of wasted food, a Number of Items text input field for entering the number of wasted items, and a large upload button for saving the post.
Tapping on the Number of Items text input field should cause the device to display its numeric keypad.
In the New Post screen, tapping the back button in the app bar should cause the List Screen to appear.
In the New Post screen, tapping the large upload button should cause the List Screen to appear, with the latest post now appearing at the top of the list.
In the New Post screen, if the Number of Items field is empty, tapping the upload button should cause a sensible error message to appear.
In addition to the functional requirements above, your application should meet the following technical requirements:

Use the location, image_picker, cloud_firestore, and firebase_storage packages to meet the functional and technical requirements.
Incorporate the use of Firebase Cloud Storage and Firebase Cloud Firestore for storing images and post data.
Data should not be stored locally on the device.
On the List Screen, the application should display the posts stored in the Firestore database.
On the Detail Screen, the application should display the image stored in the Cloud Storage bucket.
On the New Post screen, tapping the large upload button should store a new post in the Firestore database.
Each "post" in Firestore should have the following attributes: date, imageURL, quantity, latitude and longitude.
The application should incorporate the Semantics widget in multiple places, such as interactive widgets like buttons, to aid accessibility.
The codebase should incorporate a model class.
The codebase should incorporate a few (two or three) simple unit tests that test the model class.
The functional and technical requirements specifically exercise the Exploration content and our module learning outcomes. In addition, here are some optional extra credit requirements that can add up to 5% to your overall class grade:

The app bar of the List Screen should display the total sum of the number of wasted items in all posts (extra 1% added to class grade)
Add integration tests that verify any one particular part of the UX flow (extra 1% added to class grade)
Integrate the use of in-app analytics (Analytics) to monitor application usage (extra 1.5% added to class grade)
Integrate the use of crash reporting (Sentry or Crashlytics) to record application crashes (extra 1.5% added to class grade)
Consider the following steps, and consult the Tips below.

Step 1
Create a new flutter application via:

flutter create --org edu.oregonstate.YOURONID wasteagram

This ensure that your app has an intentional app id.

Step 2
Create a new Firebase project, and add an iOS and/or Android application to the project. Configure your local iOS/Android projects, and be sure you can build your app without issues.

Pro Tip: Create your Firestore database first, with its initial collection and some sample data, prior to storing objects in Cloud Storage.

In Firebase, create a Firestore database with your first named collection, eg 'posts'. Enable Cloud Storage, and modify the authorization file to not require authentication.

Step 3
Define a simple main.dart, an app.dart, and appropriate models, screens, and widgets subdirectories. Start with the basic requirements of the List Screen.

Step 4
Implement the UX flow as appropriate screens and navigation in your codebase.

Step 5
Focus on storing the photo in Cloud Storage and retrieving the URL first. Iteratively add new features to your application. See the Tips below. Pay attention to quality, especially about how your project is organized, whether you have incorporated a simple model, avoided significant nesting, defined and used many of your own custom composed widgets, and so on. The Explorations provide valuable insight on each functional and technical requirement.

Note: If you store an object in Cloud Storage prior to creating a collection in Firestore, the Firebase console may ask if you wish to use the "native" or "real-time" database. Choose the "native" database type. You can't switch once data is stored in the database. One solution is to create a new Firebase project. If you do this, it's no big deal, but don't forget to add your iOS/Android app and update the Firebase config file in your local iOS/Android projects (just overwrite the old .json config file with the new one).

You'll know this is complete when you have a program that behaves like the example UX flow displayed above, meets the description of the functional and technical requirements, stores images and post data in Firebase, passes its tests, and your code exhibits a competency of using both Dart language features and Flutter best practices. Be sure to review the rubric.
