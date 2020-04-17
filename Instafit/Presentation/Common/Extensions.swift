//
//  extensions.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//
import UIKit

//MARK: - UITextField extensions

extension UITextField {
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
}

//MARK: - UIColor extensions
extension UIColor {
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    struct RedApp  {
        static let normal = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    }
}

extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}

/// Objects conforming to `CanSaveToDisk` have a save method and provide keys for saving individual objects or a list of objects.
protocol CanSaveToDisk: Codable {

    /// Provide default logic for encoding this value.
    static var defaultEncoder: JSONEncoder { get }

    /// This key is used to save the individual object to disk. This works best by using a unique identifier.
    var storageKeyForObject: String { get }

    /// This key is used to save a list of these objects to disk. Any array of items conforming to `CanSaveToDisk` has the option to save as well.
    static var storageKeyForListofObjects: String { get }

    /// Persists the object to disk.
    ///
    /// - Throws: useful to throw an error from an encoder or a custom error if you use stage different from user defaults like the keychain
    func save() throws

}

extension Array where Element: CanSaveToDisk {

    func dataValue() throws -> Data {
        return try Element.defaultEncoder.encode(self)
    }

    func save() throws {
        let storage = UserDefaults.standard
        storage.set(try dataValue(), forKey: Element.storageKeyForListofObjects)
    }

}




