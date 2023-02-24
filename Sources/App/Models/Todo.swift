import Fluent
import Vapor

final class Todo: Model, Content {
    static let schema = Schema.todos
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String

    @Field(key: .description)
    var description: String?

    @Field(key: .order)
    var order: Double

    @Timestamp(key: .createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: .updatedAt, on: .update)
    var updatedAt: Date?

    @Field(key: .completedOn)
    var completedOn: Date?

    @Enum(key: .visibility)
    var visibility: Visibility

    // MARK: Parents
    @Parent(key: .statusID)
    var status: Status

    @Parent(key: .projectID)
    var project: Project

    init() { }

    init(
        id: UUID? = nil,
        title: String,
        description: String? = nil,
        statusID: UUID,
        projectID: UUID
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.$status.id = statusID
        self.$project.id = projectID
        self.visibility = .all
    }
}
