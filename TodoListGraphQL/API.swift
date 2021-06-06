// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CreateProjectInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - title
  public init(title: String) {
    graphQLMap = ["title": title]
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }
}

public struct CreateTaskInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - projectId
  ///   - title
  ///   - content
  public init(projectId: GraphQLID, title: String, content: String) {
    graphQLMap = ["projectId": projectId, "title": title, "content": content]
  }

  public var projectId: GraphQLID {
    get {
      return graphQLMap["projectId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "projectId")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }
}

public struct EditTaskInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - projectId
  ///   - taskId
  ///   - title
  ///   - content
  ///   - completed
  public init(projectId: GraphQLID, taskId: GraphQLID, title: Swift.Optional<String?> = nil, content: Swift.Optional<String?> = nil, completed: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["projectId": projectId, "taskId": taskId, "title": title, "content": content, "completed": completed]
  }

  public var projectId: GraphQLID {
    get {
      return graphQLMap["projectId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "projectId")
    }
  }

  public var taskId: GraphQLID {
    get {
      return graphQLMap["taskId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "taskId")
    }
  }

  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: Swift.Optional<String?> {
    get {
      return graphQLMap["content"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var completed: Swift.Optional<Bool?> {
    get {
      return graphQLMap["completed"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completed")
    }
  }
}

public final class CreateProjectMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateProject($data: CreateProjectInput!) {
      createProject(data: $data) {
        __typename
        id
        title
        tasks {
          __typename
          id
          title
          content
          completed
        }
      }
    }
    """

  public let operationName: String = "CreateProject"

  public var data: CreateProjectInput

  public init(data: CreateProjectInput) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createProject", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(CreateProject.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createProject: CreateProject) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createProject": createProject.resultMap])
    }

    public var createProject: CreateProject {
      get {
        return CreateProject(unsafeResultMap: resultMap["createProject"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createProject")
      }
    }

    public struct CreateProject: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Project"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("tasks", type: .nonNull(.list(.nonNull(.object(Task.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, tasks: [Task]) {
        self.init(unsafeResultMap: ["__typename": "Project", "id": id, "title": title, "tasks": tasks.map { (value: Task) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var tasks: [Task] {
        get {
          return (resultMap["tasks"] as! [ResultMap]).map { (value: ResultMap) -> Task in Task(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Task) -> ResultMap in value.resultMap }, forKey: "tasks")
        }
      }

      public struct Task: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Task"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, content: String, completed: Bool) {
          self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var completed: Bool {
          get {
            return resultMap["completed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "completed")
          }
        }
      }
    }
  }
}

public final class CreateTaskMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateTask($data: CreateTaskInput!) {
      createTask(data: $data) {
        __typename
        id
        title
        content
        completed
      }
    }
    """

  public let operationName: String = "CreateTask"

  public var data: CreateTaskInput

  public init(data: CreateTaskInput) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createTask", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(CreateTask.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createTask: CreateTask) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createTask": createTask.resultMap])
    }

    public var createTask: CreateTask {
      get {
        return CreateTask(unsafeResultMap: resultMap["createTask"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createTask")
      }
    }

    public struct CreateTask: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Task"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, content: String, completed: Bool) {
        self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var completed: Bool {
        get {
          return resultMap["completed"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }
    }
  }
}

public final class EditTaskMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation EditTask($data: EditTaskInput!) {
      editTask(data: $data) {
        __typename
        id
        title
        content
        completed
      }
    }
    """

  public let operationName: String = "EditTask"

  public var data: EditTaskInput

  public init(data: EditTaskInput) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("editTask", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(EditTask.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(editTask: EditTask) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "editTask": editTask.resultMap])
    }

    public var editTask: EditTask {
      get {
        return EditTask(unsafeResultMap: resultMap["editTask"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "editTask")
      }
    }

    public struct EditTask: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Task"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, content: String, completed: Bool) {
        self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var completed: Bool {
        get {
          return resultMap["completed"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }
    }
  }
}

public final class GetProjectsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetProjects {
      projects {
        __typename
        id
        title
        tasks {
          __typename
          id
          title
          content
          completed
        }
      }
    }
    """

  public let operationName: String = "GetProjects"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("projects", type: .nonNull(.list(.nonNull(.object(Project.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(projects: [Project]) {
      self.init(unsafeResultMap: ["__typename": "Query", "projects": projects.map { (value: Project) -> ResultMap in value.resultMap }])
    }

    public var projects: [Project] {
      get {
        return (resultMap["projects"] as! [ResultMap]).map { (value: ResultMap) -> Project in Project(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Project) -> ResultMap in value.resultMap }, forKey: "projects")
      }
    }

    public struct Project: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Project"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("tasks", type: .nonNull(.list(.nonNull(.object(Task.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, tasks: [Task]) {
        self.init(unsafeResultMap: ["__typename": "Project", "id": id, "title": title, "tasks": tasks.map { (value: Task) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var tasks: [Task] {
        get {
          return (resultMap["tasks"] as! [ResultMap]).map { (value: ResultMap) -> Task in Task(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Task) -> ResultMap in value.resultMap }, forKey: "tasks")
        }
      }

      public struct Task: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Task"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, content: String, completed: Bool) {
          self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var completed: Bool {
          get {
            return resultMap["completed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "completed")
          }
        }
      }
    }
  }
}

public final class GetTasksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetTasks($projectId: ID!) {
      project(id: $projectId) {
        __typename
        id
        title
        tasks {
          __typename
          id
          title
          content
          completed
        }
      }
    }
    """

  public let operationName: String = "GetTasks"

  public var projectId: GraphQLID

  public init(projectId: GraphQLID) {
    self.projectId = projectId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("project", arguments: ["id": GraphQLVariable("projectId")], type: .object(Project.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(project: Project? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "project": project.flatMap { (value: Project) -> ResultMap in value.resultMap }])
    }

    public var project: Project? {
      get {
        return (resultMap["project"] as? ResultMap).flatMap { Project(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "project")
      }
    }

    public struct Project: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Project"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("tasks", type: .nonNull(.list(.nonNull(.object(Task.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, tasks: [Task]) {
        self.init(unsafeResultMap: ["__typename": "Project", "id": id, "title": title, "tasks": tasks.map { (value: Task) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var tasks: [Task] {
        get {
          return (resultMap["tasks"] as! [ResultMap]).map { (value: ResultMap) -> Task in Task(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Task) -> ResultMap in value.resultMap }, forKey: "tasks")
        }
      }

      public struct Task: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Task"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, content: String, completed: Bool) {
          self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var completed: Bool {
          get {
            return resultMap["completed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "completed")
          }
        }
      }
    }
  }
}

public struct ProjectFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ProjectFragment on Project {
      __typename
      id
      title
      tasks {
        __typename
        ...TaskFragment
      }
    }
    """

  public static let possibleTypes: [String] = ["Project"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("tasks", type: .nonNull(.list(.nonNull(.object(Task.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, title: String, tasks: [Task]) {
    self.init(unsafeResultMap: ["__typename": "Project", "id": id, "title": title, "tasks": tasks.map { (value: Task) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var tasks: [Task] {
    get {
      return (resultMap["tasks"] as! [ResultMap]).map { (value: ResultMap) -> Task in Task(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Task) -> ResultMap in value.resultMap }, forKey: "tasks")
    }
  }

  public struct Task: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Task"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(TaskFragment.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, title: String, content: String, completed: Bool) {
      self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var taskFragment: TaskFragment {
        get {
          return TaskFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct TaskFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment TaskFragment on Task {
      __typename
      id
      title
      content
      completed
    }
    """

  public static let possibleTypes: [String] = ["Task"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("content", type: .nonNull(.scalar(String.self))),
      GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, title: String, content: String, completed: Bool) {
    self.init(unsafeResultMap: ["__typename": "Task", "id": id, "title": title, "content": content, "completed": completed])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: String {
    get {
      return resultMap["content"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "content")
    }
  }

  public var completed: Bool {
    get {
      return resultMap["completed"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "completed")
    }
  }
}
