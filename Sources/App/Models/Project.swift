import Fluent
import Vapor

final class Project: Model, Content {
    static let schema = Schema.projects

    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String

    @Field(key: .description)
    var description: String?

    @Parent(key: .statusID)
    var status: Status

    @Children(for: \.$project)
    var todos: [Todo]

    init() { }

    init(
        id: UUID? = nil,
        title: String,
        description: String? = nil,
        statusID: UUID? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.$status.id = statusID ?? UUID()
    }
}
