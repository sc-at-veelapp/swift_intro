import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let appetizers = [
        sampleAppetizer1, sampleAppetizer1, sampleAppetizer1, sampleAppetizer1,
    ]

    static let sampleAppetizer1 = Appetizer(
        id: 1,
        name: "Spicy Tuna",
        description: "Fresh tuna mixed with spicy mayo and sesame.",
        price: 9.99,
        imageURL: "",
        calories: 199,
        protein: 22,
        carbs: 9
    )
    static let sampleAppetizer2 = Appetizer(
        id: 2,
        name: "Mozzarella Sticks",
        description: "Golden fried mozzarella served with marinara sauce.",
        price: 7.99,
        imageURL: "",
        calories: 420,
        protein: 14,
        carbs: 28
    )
    static let sampleAppetizer3 = Appetizer(
        id: 3,
        name: "Chicken Wings",
        description: "Crispy buffalo wings tossed in house sauce.",
        price: 11.49,
        imageURL: "",
        calories: 520,
        protein: 32,
        carbs: 11
    )
    static let sampleAppetizer4 = Appetizer(
        id: 4,
        name: "Garlic Bread",
        description: "Toasted bread with garlic butter and herbs.",
        price: 5.49,
        imageURL: "",
        calories: 310,
        protein: 7,
        carbs: 35
    )
    static let sampleAppetizer5 = Appetizer(
        id: 5,
        name: "Shrimp Tempura",
        description: "Lightly battered shrimp fried until crispy.",
        price: 12.99,
        imageURL: "",
        calories: 390,
        protein: 25,
        carbs: 24
    )
    static let sampleAppetizer6 = Appetizer(
        id: 6,
        name: "Stuffed Mushrooms",
        description: "Mushrooms filled with cheese and herbs.",
        price: 8.49,
        imageURL: "",
        calories: 260,
        protein: 10,
        carbs: 13
    )
    static let sampleAppetizer7 = Appetizer(
        id: 7,
        name: "Nachos Supreme",
        description: "Loaded nachos with cheese, jalapeños, and salsa.",
        price: 10.99,
        imageURL: "",
        calories: 610,
        protein: 18,
        carbs: 52
    )
    static let sampleAppetizer8 = Appetizer(
        id: 8,
        name: "Spring Rolls",
        description: "Vegetable spring rolls with sweet chili sauce.",
        price: 6.99,
        imageURL: "",
        calories: 240,
        protein: 6,
        carbs: 31
    )
    static let sampleAppetizer9 = Appetizer(
        id: 9,
        name: "Bruschetta",
        description: "Toasted bread topped with tomatoes and basil.",
        price: 7.49,
        imageURL: "",
        calories: 180,
        protein: 5,
        carbs: 21
    )
    static let sampleAppetizer10 = Appetizer(
        id: 10,
        name: "Onion Rings",
        description: "Beer-battered onion rings fried crispy.",
        price: 6.49,
        imageURL: "",
        calories: 430,
        protein: 6,
        carbs: 40
    )
    static let sampleAppetizer11 = Appetizer(
        id: 11,
        name: "Potato Skins",
        description: "Crispy potato skins topped with cheese and bacon.",
        price: 8.99,
        imageURL: "",
        calories: 470,
        protein: 15,
        carbs: 33
    )
    static let sampleAppetizer12 = Appetizer(
        id: 12,
        name: "Fried Calamari",
        description: "Tender calamari served with lemon aioli.",
        price: 13.49,
        imageURL: "",
        calories: 410,
        protein: 27,
        carbs: 18
    )
    static let sampleAppetizer13 = Appetizer(
        id: 13,
        name: "Quesadilla",
        description: "Grilled tortilla filled with melted cheese.",
        price: 9.49,
        imageURL: "",
        calories: 500,
        protein: 17,
        carbs: 37
    )
    static let sampleAppetizer14 = Appetizer(
        id: 14,
        name: "Deviled Eggs",
        description: "Classic deviled eggs with paprika garnish.",
        price: 5.99,
        imageURL: "",
        calories: 190,
        protein: 11,
        carbs: 4
    )
    static let sampleAppetizer15 = Appetizer(
        id: 15,
        name: "Mini Sliders",
        description: "Three mini beef sliders with cheddar cheese.",
        price: 12.49,
        imageURL: "",
        calories: 580,
        protein: 29,
        carbs: 36
    )
    static let sampleAppetizer16 = Appetizer(
        id: 16,
        name: "Hummus Plate",
        description: "Creamy hummus served with pita bread.",
        price: 7.99,
        imageURL: "",
        calories: 270,
        protein: 9,
        carbs: 26
    )
    static let sampleAppetizer17 = Appetizer(
        id: 17,
        name: "Cheese Fries",
        description: "French fries smothered in melted cheddar.",
        price: 8.49,
        imageURL: "",
        calories: 540,
        protein: 10,
        carbs: 49
    )
    static let sampleAppetizer18 = Appetizer(
        id: 18,
        name: "Spinach Dip",
        description: "Warm spinach and cheese dip with tortilla chips.",
        price: 9.99,
        imageURL: "",
        calories: 460,
        protein: 12,
        carbs: 22
    )
    static let sampleAppetizer19 = Appetizer(
        id: 19,
        name: "Beef Satay",
        description: "Grilled beef skewers with peanut sauce.",
        price: 11.99,
        imageURL: "",
        calories: 350,
        protein: 31,
        carbs: 12
    )
    static let sampleAppetizer20 = Appetizer(
        id: 20,
        name: "Coconut Shrimp",
        description: "Shrimp coated in coconut flakes and fried crispy.",
        price: 13.99,
        imageURL: "",
        calories: 480,
        protein: 24,
        carbs: 29
    )

    static let orderItems = [
        sampleAppetizer1,
        sampleAppetizer2,
        sampleAppetizer3,
        sampleAppetizer4,
        sampleAppetizer5,
        sampleAppetizer6,
        sampleAppetizer7,
        sampleAppetizer8,
        sampleAppetizer9,
        sampleAppetizer10,
        sampleAppetizer11,
        sampleAppetizer12,
        sampleAppetizer13,
        sampleAppetizer14,
        sampleAppetizer15,
        sampleAppetizer16,
        sampleAppetizer17,
        sampleAppetizer18,
        sampleAppetizer19,
        sampleAppetizer20,
    ]
}
