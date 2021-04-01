//
//  UserDefalutValue.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import Foundation

// 자동으로 스토리지와 연결해주는 프로퍼티 래퍼입니다.
@propertyWrapper
struct LinkStorage<Value: Codable> {
    let key: String     // 저장소 키
    let defaultValue: Value // 해당 저장소에 데이터가 없으면 사용되는 데이터입니다.
    
    var wrappedValue: Value {
        get {
            // 저장소에서 데이터를 불러옵니다.
            let data = UserDefaults.standard.data(forKey: key)
            // nil 데이터를 제거하고 JSON 데이터를 디코딩합니다.
            let value = data.flatMap {
                try? JSONDecoder().decode(Value.self, from: $0)
            }
            // 저장소에 데이터가 없다면 defaultValue를 반환합니다.
            return value ?? defaultValue
        }
        set {
            // 데이터를 JSON으로 인코딩합니다.
            let data = try? JSONEncoder().encode(newValue)
            // 저장소에 JSON 데이터를 저장합니다.
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
