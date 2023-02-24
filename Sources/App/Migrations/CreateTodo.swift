import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Schema.todos)
            .id()
            .field(.title, .string, .required)
            .field(.description, .string)
            .field(.order, .double)
            .field(.createdAt, .datetime)
            .field(.updatedAt, .datetime)
            .field(.statusID, .uuid, .references(Schema.status, .id))
            .field(.projectID, .uuid, .references(Schema.projects, .id))
            .field(.visibility, .string)
            .field(.completedOn, .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.todos).delete()
    }
}
