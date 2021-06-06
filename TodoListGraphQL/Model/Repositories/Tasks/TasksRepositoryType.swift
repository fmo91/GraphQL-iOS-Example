//
//  TasksRepositoryType.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Combine

protocol TasksRepositoryType: AnyObject {
    func getTasks(for projectId: String) -> AnyPublisher<[Task], Error>
    func createTask(projectId: String, title: String, content: String) -> AnyPublisher<Task, Error>
    func editTask(task: Task) -> AnyPublisher<Void, Error>
}
