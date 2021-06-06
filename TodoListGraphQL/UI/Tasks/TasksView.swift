//
//  TasksView.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import SwiftUI

struct TasksView: View {
    @StateObject var viewModel: TasksViewModel

    init(
        for project: Project,
        repository: TasksRepositoryType = TasksRepository()
    ) {
        self._viewModel = StateObject(
            wrappedValue: TasksViewModel(
                project: project,
                repository: repository
            )
        )
    }

    var body: some View {
        List {
            VStack {
                TextField("Task name", text: $viewModel.taskTitle)
                TextField("Task content", text: $viewModel.taskContent)
                Button("Create", action: viewModel.createTask)
            }
            ForEach(viewModel.tasks) { task in
                Button(action: { self.viewModel.toggleTaskState(on: task) }) {
                    TaskRow(task: task)
                }
            }
        }
        .navigationTitle(Text(viewModel.title))
        .onAppear {
            viewModel.reload()
        }
    }
}


#if DEBUG
struct TasksView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TasksView(
                    for: Project(
                        id: "1",
                        title: "Some Project"
                    ),
                    repository: DummyTasksRepository()
                )
            }
        }
    }
}
#endif
