import Fluent
import Vapor

final class Status: Model, Content {
    static let schema = "status"

    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String

    @Field(key: .color)
    var color: String

    @Enum(key: .statusEquivalent)
    var statusEquivalent: StatusEquivalent

    @Children(for: \.$status)
    var todos: [Todo]

    init() { }

    init(
        id: UUID? = nil,
        title: String,
        statusEquivalent: StatusEquivalent,
        color: String
    ) {
        self.id = id
        self.title = title
        self.statusEquivalent = .backlog
        self.color = color
    }
}
