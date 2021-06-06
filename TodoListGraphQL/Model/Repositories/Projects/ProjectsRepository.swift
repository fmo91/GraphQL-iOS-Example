//
//  ProjectsRepository.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 06/06/2021.
//

import Combine

final class ProjectRepository: ProjectsRepositoryType {
    func getProjects() -> AnyPublisher<[Project], Error> {
        GraphQL.shared.client.fetch(query: GetProjectsQuery())
            .map { value in
                return value.projects.map { project in
                    Project(
                        id: project.id,
                        title: project.title,
                        tasks: project.tasks.map { task in
                            Task(
                                id: task.id,
                                projectId: project.id,
                                title: task.title,
                                content: task.content,
                                completed: task.completed
                            )
                        }
                    )
                }
            }
            .eraseToAnyPublisher()
    }

    func createProject(title: String) -> AnyPublisher<Project, Error> {
        let data = CreateProjectInput(title: title)
        return GraphQL.shared.client.mutate(mutation: CreateProjectMutation(data: data))
            .map { value in
                return Project(id: value.createProject.id, title: value.createProject.title)
            }
            .eraseToAnyPublisher()
    }
}
