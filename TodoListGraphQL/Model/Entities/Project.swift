//
//  Project.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Foundation

struct Project: Identifiable, Equatable {
    let id: String
    let title: String
    let tasks: [Task]

    init(id: String, title: String, tasks: [Task] = []) {
        self.id = id
        self.title = title
        self.tasks = tasks
    }
}
