//
//  TasksViewModel.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Combine

final class TasksViewModel: ObservableObject {
    @Published var taskTitle = ""
    @Published var taskContent = ""
    @Published var tasks: [Task] = []
    var title: String {
        project.title
    }

    private var cancellables: Set<AnyCancellable> = []

    private let project: Project
    private let repository: TasksRepositoryType

    init(project: Project, repository: TasksRepositoryType) {
        self.project = project
        self.repository = repository
    }

    func reload() {
        self.repository
            .getTasks(for: project.id)
            .replaceError(with: [])
            .assign(to: \.tasks, on: self)
            .store(in: &cancellables)
    }

    func createTask() {
        guard !taskTitle.isEmpty else {
            return
        }

        self.repository
            .createTask(projectId: project.id, title: taskTitle, content: taskContent)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] project in
                    guard let self = self else { return }
                    self.reload()
                    self.taskTitle = ""
                    self.taskContent = ""
                }
            )
            .store(in: &cancellables)
    }

    func toggleTaskState(on task: Task) {
        var taskCopy = task
        taskCopy.completed.toggle()

        self.repository
            .editTask(task: taskCopy)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] project in
                    guard let self = self else { return }
                    self.reload()
                }
            )
            .store(in: &cancellables)
    }
}
