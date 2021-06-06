//
//  ProjectsRepositoryType.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Foundation
import Combine

protocol ProjectsRepositoryType: AnyObject {
    func getProjects() -> AnyPublisher<[Project], Error>
    func createProject(title: String) -> AnyPublisher<Project, Error>
}

