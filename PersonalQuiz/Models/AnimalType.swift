//
//  AnimalType.swift
//  PersonalQuiz
//
//  Created by Egor Ukolov on 09.09.2023.
//

enum AnimalType: Character {
    case dog = "🐶"
    case rabbit = "🐰"
    case cat = "🐱"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, котрые вам нравятся и всегда готовы вам помочь"
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии"
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество"
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях"
        }
    }
}
