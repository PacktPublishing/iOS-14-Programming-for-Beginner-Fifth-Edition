# iOS 14 Programming for Beginners - Fifth Edition

<a href="https://www.packtpub.com/product/iOS-14-Programming-for-beginners-fifth-edition/9781800209749"><img src="https://static.packt-cdn.com/products/9781800209749/cover/smaller" alt="iOS 14 Programming for Beginners - Fifth Edition" height="256px" align="right"></a>

This is the code repository for [iOS 14 Programming for Beginners - Fifth Edition](https://www.packtpub.com/product/iOS-14-Programming-for-beginners-fifth-edition/9781800209749), published by Packt.

**Get started with building iOS apps with Swift 5.3 and Xcode 12**

## What is this book about?
If you're a beginner looking to work and experiment with powerful iOS 14 features such as widgets and App Clips to create your own apps, this iOS programming guide is for you. The book offers a comprehensive introduction for experienced programmers who are new to iOS, taking you through the entire process of learning the Swift language, writing your own apps, and publishing them on the App Store.


This book covers the following exciting features: 
* Get to grips with the fundamentals of Xcode 12 and Swift 5.3, the building blocks of iOS development
* Understand how to prototype an app using storyboards
* Discover the Model-View-Controller design pattern and how to implement the desired functionality within an app
* Implement the latest iOS features, such as widgets and App Clips
* Convert an existing iPad app into an Apple Silicon Mac app
* Design, deploy, and test your iOS applications with design patterns and best practices

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1800209746) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations
All of the code is organized into folders. For example, Chapter02.

The code will look like the following:
```
if (test expression)
{
  Statement upon condition is true
}
```

**Following is what you need for this book:**
This book is for anyone who has programming experience but is new to Swift and iOS app development. Experienced programmers looking to explore the latest iOS 14 features will also find this book useful.

With the following software and hardware list you can run all code files present in the book (Chapter 1-26).

### Software and Hardware List

| Chapter  | Software required                   | OS required                        |
| -------- | ------------------------------------| -----------------------------------|
| 1  to 26      | Xcode 12 or later                  |macOS 10.15 Catalina, macOS 11.0 Big Sur, or later |
| 26        | Apple Developer account           |macOS 10.15 Catalina, macOS 11.0 Big Sur, or later |



We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://static.packt-cdn.com/downloads/9781800209749_ColorImages.pdf).

## Code in Action

Click on the following link to see the Code in Action:

[YouTube](https://www.youtube.com/playlist?list=PLeLcvrwLe185F_1WQm7HyUuM3Vbn6PEVf)

### Errata
* Page 423: After point 2, a code block is missing. The code block is as follows:

```
//MARK: UITableViewDelegate

extension LocationViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt 

  indexPath: IndexPath) {

    if let cell = tableView.cellForRow(at: indexPath) {

      cell.accessoryType = .checkmark 

      selectedCity = manager.locationItem(at: indexPath)

      tableView.reloadData()

    }

  }

}
```

### Related products <Other books you may enjoy>
* Learn SwiftUI [[Packt]](https://www.packtpub.com/product/learn-swiftui/9781839215421) [[Amazon]](https://www.amazon.com/dp/1839215429)

* SwiftUI Cookbook [[Packt]](https://www.packtpub.com/product/swiftui-cookbook/9781838981860) [[Amazon]](https://www.amazon.com/dp/1838981861)

## Get to Know the Author
**Ahmad Sahar**
is a trainer, presenter, and consultant at Tomafuwi Productions, specializing
in conducting training courses for macOS and iOS, macOS Support Essentials certification
courses, and iOS Development courses. He is a member of the DevCon iOS and
MyCocoaHeads online communities in Malaysia, and has conducted presentations and talks
for both groups. In his spare time, he likes building and programming LEGO Mindstorms
robots.

## Other books by the author
* [iOS 13 Programming for Beginners - Fourth Edition](https://www.packtpub.com/product/ios-13-programming-for-beginners-fourth-edition/9781838821906)
