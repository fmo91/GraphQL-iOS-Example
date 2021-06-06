//
//  ProjectsView.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import SwiftUI

struct ProjectsView: View {
    @StateObject private var viewModel: ProjectsViewModel

    init(repository: ProjectsRepositoryType = ProjectRepository()) {
        _viewModel = StateObject(
            wrappedValue: ProjectsViewModel(
                repository: repository
            )
        )
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    TextField("Project name", text: $viewModel.projectTitle)
                    Button("Create", action: viewModel.createProject)
                }
                ForEach(viewModel.projects) { project in
                    NavigationLink(destination: TasksView(for: project)) {
                        ProjectRow(project: project)
                    }
                }
            }
        }
        .navigationTitle(Text("Projects"))
        .onAppear {
            viewModel.reload()
        }
    }
}

#if DEBUG
struct ProjectsView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ProjectsView(repository: DummyProjectsRepository())
            }
        }
    }
}
#endif
