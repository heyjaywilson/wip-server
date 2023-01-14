import Fluent
import Vapor

final class Todo: Model, Content {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Field(key: "description")
    var description: String?

    @Field(key: "order")
    var order: Int

    @Timestamp(key: "createdAt", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updatedAt", on: .update)
    var updatedAt: Date?

    @Parent(key: "statusID")
    var status: Status

    init() { }

    init(
        id: UUID? = nil,
        title: String,
        description: String? = nil,
        statusID: Status.IDValue
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.$status.id = statusID
    }
}
