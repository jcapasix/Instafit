//
//  Item.swift
//  Instafit
//
//  Created by Jordan Capa on 4/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import CoreData


// MARK: - ItemsResponse
struct ItemsResponse: Codable {
    let data: [Item]
    let code: Int
    let message: String
}

// MARK: - Datum
struct Item: Codable{
    
    let id: Int
    let name: String
//    let name, datumDescription: String
//    let duration: Int
//    let active, free: Bool
//    let met: Double
//    let excerpt, slug: String
//    let isNew, sticky: Bool
//    let kind, language: String
//    let coach: Coach
//    let types, levels: [Level]
//    let focuses: [Focus]
//    let apps: [Int]
//    let treadmill: Treadmill
//    let audio: Audio
//    let music: Music
//    let exercises: [Exercise]
//    let equipment: [JSONAny]
//    let estimatedCaloriesBurned: Double
//    let favorited, loved, hated: Bool
//    let rating: DatumRating
//    let reproductions: Int
    let cover: String
//    let coverPictures: CoverPictures

    enum CodingKeys: String, CodingKey {
        case id, name
//        case datumDescription = "description"
//        case duration, active, free, met, excerpt, slug
//        case isNew = "is_new"
//        case sticky, kind, language, coach, types, levels, focuses, apps, treadmill, audio, music, exercises, equipment
//        case estimatedCaloriesBurned = "estimated_calories_burned"
//        case favorited, loved, hated, rating, reproductions
        case cover
//        case coverPictures = "cover_pictures"
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        self.id = aDecoder.decodeObject(forKey: "id") as? Int ?? 0
//        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
//        self.cover = aDecoder.decodeObject(forKey: "cover") as? String ?? ""
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(id, forKey: "id")
//        aCoder.encode(name, forKey: "name")
//        aCoder.encode(cover, forKey: "cover")
//    }
//
    
    



}

    extension ItemEntity{
        
        func mapper(item:Item){
            self.id = Int16(item.id)
            self.name = item.name
            self.cover = item.cover

        }
        
        func getItem() -> Item{
            return Item(id: Int(self.id), name: self.name ?? "", cover: self.cover ?? "")
        }
        
    }




//// MARK: - Audio
//struct Audio: Codable {
//    let audioDownload: String
//    let embededMusicURL: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case audioDownload = "audio_download"
//        case embededMusicURL = "embeded_music_url"
//    }
//}
//
//// MARK: - Coach
//struct Coach: Codable {
//    let id: Int
//    let name, coachDescription: String
//    let filterAvailable: Bool
//    let avatar: String
//    let avatarPictures: AvatarPictures
//    let rating: CoachRating
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case coachDescription = "description"
//        case filterAvailable = "filter_available"
//        case avatar
//        case avatarPictures = "avatar_pictures"
//        case rating
//    }
//}
//
//// MARK: - AvatarPictures
//struct AvatarPictures: Codable {
//    let fullSize, big, medium, small: String
//    let webp: String
//
//    enum CodingKeys: String, CodingKey {
//        case fullSize = "full_size"
//        case big, medium, small, webp
//    }
//}
//
//// MARK: - CoachRating
//struct CoachRating: Codable {
//    let lovesCount, hatesCount, votes, rate: Int
//
//    enum CodingKeys: String, CodingKey {
//        case lovesCount = "loves_count"
//        case hatesCount = "hates_count"
//        case votes, rate
//    }
//}
//
//// MARK: - CoverPictures
//struct CoverPictures: Codable {
//    let fullSize, big, medium, small: String
//    let webp, square, landscape: String
//
//    enum CodingKeys: String, CodingKey {
//        case fullSize = "full_size"
//        case big, medium, small, webp, square, landscape
//    }
//}
//
//// MARK: - Exercise
//struct Exercise: Codable {
//    let name: String
//    let exerciseDescription: String?
//    let videoURL: String
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case exerciseDescription = "description"
//        case videoURL = "video_url"
//    }
//}
//
//// MARK: - Focus
//struct Focus: Codable {
//    let id: Int
//    let name, shortTag: String
//    let filterAvailable: Bool
//    let sortLevel: Int
//    let focusDescription: String
//    let featured: Bool
//    let icon: String
//    let suggestedLabel: String
//    let workoutsNumber: Int
//    let hierarchy: Hierarchy
//    let cover: String
//    let coverPictures: CoverPictures
//    let featuredCover: String
//    let featuredCoverPictures: CoverPictures
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case shortTag = "short_tag"
//        case filterAvailable = "filter_available"
//        case sortLevel = "sort_level"
//        case focusDescription = "description"
//        case featured, icon
//        case suggestedLabel = "suggested_label"
//        case workoutsNumber = "workouts_number"
//        case hierarchy, cover
//        case coverPictures = "cover_pictures"
//        case featuredCover = "featured_cover"
//        case featuredCoverPictures = "featured_cover_pictures"
//    }
//}
//
//// MARK: - Hierarchy
//struct Hierarchy: Codable {
//    let root: Bool
//    let children: [JSONAny]
//}
//
//// MARK: - Level
//struct Level: Codable {
//    let id: Int
//    let name: Name
//    let shortTag: String?
//    let filterAvailable: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case shortTag = "short_tag"
//        case filterAvailable = "filter_available"
//    }
//}
//
//enum Name: String, Codable {
//    case fun = "fun"
//    case hiit = "hiit"
//    case intermediate = "Intermediate"
//}
//
//// MARK: - Music
//struct Music: Codable {
//    let enableMusic: Bool
//    let spotify, applemusic, instafit: Applemusic
//    let artwork: Artwork
//
//    enum CodingKeys: String, CodingKey {
//        case enableMusic = "enable_music"
//        case spotify, applemusic, instafit, artwork
//    }
//}
//
//// MARK: - Applemusic
//struct Applemusic: Codable {
//    let playlistid: String
//}
//
//// MARK: - Artwork
//struct Artwork: Codable {
//}
//
//// MARK: - DatumRating
//struct DatumRating: Codable {
//    let lovesCount, hatesCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case lovesCount = "loves_count"
//        case hatesCount = "hates_count"
//    }
//}
//
//// MARK: - Treadmill
//struct Treadmill: Codable {
//    let incline, speed, distance: Int
//}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
