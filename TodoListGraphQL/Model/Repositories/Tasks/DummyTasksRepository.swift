//
//  DummyTasksRepository.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Foundation
import Combine

class DummyTasksRepository: TasksRepositoryType {
    func getTasks(for projectId: String) -> AnyPublisher<[Task], Error> {
        return Just([
            Task(
                id: "1",
                projectId: "1",
                title: "Some Task",
                content: "Some content",
                completed: false
            ),
            Task(
                id: "2",
                projectId: "1",
                title: "Second Task",
                content: "Some content...",
                completed: true
            ),
            Task(
                id: "3",
                projectId: "1",
                title: "Third Task",
                content: "Some third content",
                completed: false
            ),
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    func createTask(projectId: String, title: String, content: String) -> AnyPublisher<Task, Error> {
        return Just(
            Task(
                id: UUID().uuidString,
                projectId: projectId,
                title: title,
                content: content,
                completed: false
            )
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    func editTask(task: Task) -> AnyPublisher<Void, Error> {
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
