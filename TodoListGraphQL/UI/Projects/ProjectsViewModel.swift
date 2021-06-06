//
//  ProjectsViewModel.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Combine

final class ProjectsViewModel: ObservableObject {
    @Published var projects: [Project] = []
    @Published var projectTitle: String = ""

    private var cancellables: Set<AnyCancellable> = []

    private let repository: ProjectsRepositoryType

    init(repository: ProjectsRepositoryType) {
        self.repository = repository
    }

    func reload() {
        self.repository
            .getProjects()
            .replaceError(with: [])
            .assign(to: \.projects, on: self)
            .store(in: &cancellables)
    }

    func createProject() {
        guard !projectTitle.isEmpty else {
            return
        }

        self.repository
            .createProject(title: projectTitle)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] project in
                    guard let self = self else { return }
                    self.reload()
                    self.projectTitle = ""
                }
            )
            .store(in: &cancellables)
    }
}
