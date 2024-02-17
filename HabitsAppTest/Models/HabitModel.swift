//
//  HabitModel.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

enum HabitType: String, Codable {
    case positive
    case negative
}

class HabitModel: ObservableObject, Codable, Identifiable {
    @Published var name: String
    @Published var type: HabitType
    @Published var progress: ProgressModel

    init(name: String, type: HabitType, progress: ProgressModel) {
        self.name = name
        self.type = type
        self.progress = progress
    }

    // Добавляем соответствие протоколу Encodable
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(progress, forKey: .progress)
    }

    // Добавляем соответствие протоколу Decodable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(HabitType.self, forKey: .type)
        progress = try container.decode(ProgressModel.self, forKey: .progress)
    }

    // Перечисляем ключи для кодирования и декодирования
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case progress
    }
}

extension HabitModel: Equatable {
    static func == (lhs: HabitModel, rhs: HabitModel) -> Bool {
        // Реализуйте сравнение HabitModel, например, по имени
        return lhs.name == rhs.name
    }
}

