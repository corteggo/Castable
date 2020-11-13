# Castable

This projects allows transforming entities using Codable.

## Usage

```swift
struct Model1: Castable {
    var field1: String
    
    enum CodingKeys: CodingKey, String {
        case field1 = "fieldName"
    }
}

struct Model2: Castable {
    var field2: String
    
    enum CodingKeys: CodingKey, String {
        case field2 = "fieldName"
    }
}


let model1: Model1 = Model1(field1: "1")
let model2: Model2 = Model2(field2: "2")

let model1AsModel2: Model2 = model1.as(Model2.self)
let model2AsModel1: Model1 = model2.as(Model1.self)
```
