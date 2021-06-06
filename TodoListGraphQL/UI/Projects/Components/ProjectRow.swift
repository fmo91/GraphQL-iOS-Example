//
//  ProjectRow.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import SwiftUI

struct ProjectRow: View {
    let project: Project

    var body: some View {
        VStack(alignment: .leading) {
            Text(project.title)
                .font(.headline)
            Text("\(project.tasks.count) tasks")
                .font(.subheadline)
        }
    }
}
