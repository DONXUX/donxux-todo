//
//  UserDefalutValue.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import Foundation

// This is property wrapper to link to storage automatically
@propertyWrapper
struct LinkStorage<Value: Codable> {
    let key: String     // Storage key
    let defaultValue: Value // If the data in the storage key is empty, this is value to be used.
    
    var wrappedValue: Value {
        get {
            // Load data from storage.
            let data = UserDefaults.standard.data(forKey: key)
            // Delete nil at data and decoding JSON
            let value = data.flatMap {
                try? JSONDecoder().decode(Value.self, from: $0)
            }
            // If empty value, return default value
            return value ?? defaultValue
        }
        set {
            // Encoding data
            let data = try? JSONEncoder().encode(newValue)
            // Save data to storage.
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
