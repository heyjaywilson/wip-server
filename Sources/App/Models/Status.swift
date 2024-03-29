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

    @Field(key: .description)
    var description: String

    @Enum(key: .statusEquivalent)
    var statusEquivalent: StatusEquivalent

    init() { }

    init(
        id: UUID? = nil,
        title: String,
        statusEquivalent: StatusEquivalent,
        description: String,
        color: String
    ) {
        self.id = id
        self.title = title
        self.statusEquivalent = .backlog
        self.description = description
        self.color = color
    }
}
