//
//  DummyProjectsRepository.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Foundation
import Combine

final class DummyProjectsRepository: ProjectsRepositoryType {
    func getProjects() -> AnyPublisher<[Project], Error> {
        return Just([
            Project(
                id: "1",
                title: "The best project",
                tasks: [
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
                ]
            )
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    func createProject(title: String) -> AnyPublisher<Project, Error> {
        return Just(
            Project(
                id: "1",
                title: "The best project",
                tasks: [
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
                ]
            )
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
