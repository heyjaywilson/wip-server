import Fluent

struct CreateProject: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Schema.projects)
            .id()
            .field(.title, .string, .required)
            .field(.description, .string)
            .field(.statusID, .uuid, .references(Schema.status, .id))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.projects).delete()
    }
}
