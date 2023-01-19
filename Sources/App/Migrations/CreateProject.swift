import Fluent

struct CreateProject: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Schema.projects)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.projects).delete()
    }
}
