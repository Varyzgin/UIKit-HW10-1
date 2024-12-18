//
//  Content.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/16/24.
//

enum Content : Int, CaseIterable {
    case stories = 0
    case messages = 1
    case announcements = 2
    case feeds = 3
    
    func items() -> [Items] {
        switch self {
        case .stories:
            return Stories.items()
        case .messages:
            return Messages.items()
        case .announcements:
            return Announcements.items()
        case .feeds:
            return Feeds.items()
        }
    }
}

protocol Items {
    static func items() -> [Self]
}

struct Stories : Items {
    let pictureName : String
    let authorName : String
    
    static func items() -> [Stories] {
        [
            Stories(pictureName: "picture1", authorName: "Author1"),
            Stories(pictureName: "picture2", authorName: "Author2"),
            Stories(pictureName: "picture3", authorName: "Author3"),
            Stories(pictureName: "picture4", authorName: "Author4"),
            Stories(pictureName: "picture5", authorName: "Author5"),
            Stories(pictureName: "picture6", authorName: "Author6"),
        ]
    }
}

struct Messages : Items {
    let pictureName : String
    let messageText : String
    
    static func items() -> [Messages] {
        [
            Messages(pictureName: "picture1", messageText: "A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass."),
            Messages(pictureName: "picture2", messageText: "Classes in Swift can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior."),
            Messages(pictureName: "picture3", messageText: "Classes can also add property observers to inherited properties in order to be notified when the value of a property changes. Property observers can be added to any property, regardless of whether it was originally defined as a stored or computed property."),
            Messages(pictureName: "picture4", messageText: "Subclassing is the act of basing a new class on an existing class. The subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass."),
            Messages(pictureName: "picture5", messageText: "The new Bicycle class automatically gains all of the characteristics of Vehicle, such as its currentSpeed and description properties and its makeNoise() method."),
            Messages(pictureName: "picture6", messageText: "In addition to the characteristics it inherits, the Bicycle class defines a new stored property, hasBasket, with a default value of false (inferring a type of Bool for the property).")
        ]
    }
}

struct Announcements : Items {
    let posterName : String
    let headerText : String
    let descriptionText : String
    
    static func items() -> [Announcements] {
        [
            Announcements(posterName: "poster1", headerText: "Hello", descriptionText: "Tandem inherits all of the properties and methods from Bicycle"),
            Announcements(posterName: "poster2", headerText: "World", descriptionText: "Tandem inherits all of the properties and methods from Bicycle"),
            Announcements(posterName: "poster3", headerText: "Nice?", descriptionText: "Tandem inherits all of the properties and methods from Bicycle"),
        ]
    }
}

struct Feeds : Items {
    let photoName : String
    let headerText : String
    let descriptionText : String
    
    static func items() -> [Feeds] {
        [
            Feeds(photoName: "photo1", headerText: "Hello", descriptionText: "Tandem inherits all of the properties and methods from Bicycle"),
            Feeds(photoName: "photo2", headerText: "World", descriptionText: "Tandem inherits all of the properties and methods from Bicycle"),
        ]
    }
}
