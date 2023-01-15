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

    @Parent(key: .statusID)
    var status: Status

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
        self.$status.id = UUID(uuidString: "624f59d6-6cc6-4d16-b760-a483369db7a3")!
    }
}
