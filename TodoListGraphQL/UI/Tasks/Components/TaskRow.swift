//
//  TaskRow.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import SwiftUI

struct TaskRow: View {
    let task: Task

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text(task.content)
                    .font(.subheadline)
            }
            Spacer()
            if task.completed {
                Text("DONE")
                    .bold()
                    .foregroundColor(.green)
            } else {
                Text("PENDING")
                    .bold()
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#if DEBUG
struct TaskRow_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            TaskRow(
                task: Task(
                    id: "1",
                    projectId: "1",
                    title: "Some Task",
                    content: "Some content",
                    completed: true
                )
            )
            .previewDisplayName("Completed task")


            TaskRow(
                task: Task(
                    id: "1",
                    projectId: "1",
                    title: "Some Task",
                    content: "Some content",
                    completed: false
                )
            )
            .previewDisplayName("Pending task")
        }
    }
}
#endif
