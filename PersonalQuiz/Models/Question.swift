//
//  Question.swift
//  PersonalQuiz
//
//  Created by Egor Ukolov on 06.09.2023.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу вы препочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle)
                ]
            ),
            Question(
                text: "Что вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(text: "Ненавижу", type: .dog),
                    Answer(text: "", type: .cat),
                    Answer(text: "", type: .rabbit),
                    Answer(text: "Обожаю", type: .turtle)
                ]
            ),
        ]
    }
}
