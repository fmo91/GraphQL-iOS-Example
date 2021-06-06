//
//  Task.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Foundation

struct Task: Identifiable, Equatable {
    let id: String
    let projectId: String
    let title: String
    let content: String
    var completed: Bool
}
