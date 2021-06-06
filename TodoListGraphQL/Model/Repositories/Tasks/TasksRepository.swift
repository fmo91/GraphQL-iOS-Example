//
//  TasksRepository.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Combine

final class TasksRepository: TasksRepositoryType {
    func getTasks(for projectId: String) -> AnyPublisher<[Task], Error> {
        GraphQL.shared.client.fetch(query: GetTasksQuery(projectId: projectId))
            .map { value in
                return (value.project?.tasks ?? []).map { task in
                    Task(
                        id: task.id,
                        projectId: projectId,
                        title: task.title,
                        content: task.content,
                        completed: task.completed
                    )
                }
            }
            .eraseToAnyPublisher()
    }

    func createTask(projectId: String, title: String, content: String) -> AnyPublisher<Task, Error> {
        let data = CreateTaskInput(projectId: projectId, title: title, content: content)
        return GraphQL.shared.client.mutate(mutation: CreateTaskMutation(data: data))
            .map { value in
                return Task(
                    id: value.createTask.id,
                    projectId: projectId,
                    title: value.createTask.title,
                    content: value.createTask.content,
                    completed: value.createTask.completed
                )
            }
            .eraseToAnyPublisher()
    }

    func editTask(task: Task) -> AnyPublisher<Void, Error> {
        let data = EditTaskInput(
            projectId: task.projectId,
            taskId: task.id,
            title: task.title,
            content: task.content,
            completed: task.completed
        )
        return GraphQL.shared.client.mutate(mutation: EditTaskMutation(data: data))
            .map { _ in return () }
            .eraseToAnyPublisher()
    }
}
